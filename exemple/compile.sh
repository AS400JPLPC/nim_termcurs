#!/bin/bash

faStabilo='\033[7m'
fcRouge='\033[31m'
fcJaune='\033[33;1m'
fcCyan='\033[36m'
fcGreen='\033[32m'


#-------------------------------------------------------------------
# ccontrôle si projet nim
#-------------------------------------------------------------------
if [[ ! "$2" =~ '.nim' ]]; then
echo -en $faStabilo$fcJaune"$2 -->"$faStabilo$fcRouge"ce n'est pas un fichier .nim \033[0;0m\\n"
exit 0 
fi


mode=$1

projet_src=$2

projet_bin=${projet_src%.*}



#-------------------------------------------------------------------
# clean
#-------------------------------------------------------------------
if test -f $projet_bin ; then
	rm -f $projet_bin
fi

#-------------------------------------------------------------------
# compile
#-------------------------------------------------------------------

if [ "$mode" == "DEBUG" ] ; then
  if [ "$projet_bin" == "TermVte" ] || [ "$projet_bin" == "contactVte" ] || [ "$projet_bin" == "TermVteGrid" ] || [ "$projet_bin" == "testVte" ] ; then
    nim  c  -f --gc:arc -d:forceGtk  -d:useMalloc --panics:on --threads:on --deadCodeElim:on --hint[Performance]:off  --app:GUI --passL:-no-pie -o:$projet_bin   $projet_src
  else
    nim  c  -f --gc:arc -d:useMalloc --deadCodeElim:on --panics:on  --threads:on	 --hint[Performance]:off   -o:$projet_bin   $projet_src
  fi
fi

if [ "$mode" == "PROD" ] ; then
  if [ "$projet_bin" == "TermVte" ] || [ "$projet_bin" == "contactVte" ]  || [ "$projet_bin" == "TermVteGrid" ] || [ "$projet_bin" == "testVte" ] ; then
    nim  c -f --verbosity:0 --gc:arc --hints:off -d:forceGtk -d:useMalloc	 --warning[UnusedImport]:off  --deadCodeElim:on  --hint[Performance]:off   --panics:on  --threads:on --opt:size --app:GUI  --passL:-no-pie --passc:-flto -d:release  -o:$projet_bin   $projet_src
  else
    nim  c -f --gc:arc --verbosity:0 --hints:off 	-d:useMalloc --deadCodeElim:on --hint[Performance]:off   --app:CONSOLE  --panics:on  --threads:on --opt:size  -d:release  -o:$projet_bin   $projet_src
  fi
fi
#-------------------------------------------------------------------
# resultat
#-------------------------------------------------------------------
  
	echo -en '\033[0;0m'	# video normal
	echo " "
	if test -f "$projet_bin"; then
		echo -en $faStabilo$fcCyan"BUILD "$mode"\033[0;0m  "$fcJaune$projet_src"->\033[0;0m  "$fcGreen $projet_bin "\033[0;0m"
		echo -en "  size : " 
		ls -lrtsh $projet_bin | cut -d " " -f6
	else
		echo -en $faStabilo$fcCyan"BUILD "$mode"\033[0;0m  "$fcJaune$projet_src"->\033[0;0m  "$faStabilo$fcRouge"not compile\033[0;0m\n"
	fi
	echo " "
exit
