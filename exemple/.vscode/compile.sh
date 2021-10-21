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
  if [ "$projet_bin" == "contactVte" ] || [ "$projet_bin" == "contactVte" ] || [ "$projet_bin" == "TermVteField" ] || [ "$projet_bin" == "TermVteGrid" ] || [ "$projet_bin" == "TermVteTest" ] ; then
  	( set -x ; \
    		nim c -f --gc:orc -d:forceGtk -d:useMalloc  --panics:on \
			--debuginfo --linedir:on \
			--verbosity:1 \
			--warning[UnusedImport]:on --hint[Performance]:off --warning[Deprecated]:on --warning[EachIdentIsTuple]:on \
			--threads:on \
			--passL:-no-pie --app:GUI  \
			-o:$projet_bin   $projet_src ; \
	)
  else
	( set -x ; \
		nim  c  -f --gc:orc -d:useMalloc  --panics:on \
			--debuginfo --linedir:on \
			--verbosity:1 \
			--warning[UnusedImport]:on --hint[Performance]:off  --warning[Deprecated]:on --warning[EachIdentIsTuple]:on \
			--threads:on \
			-o:$projet_bin   $projet_src ; \
	)
  fi
fi

if [ "$mode" == "PROD" ] ; then
  if [ "$projet_bin" == "Kakoun" ] || [ "$projet_bin" == "contactVte" ] || [ "$projet_bin" == "contactVte" ]  || [ "$projet_bin" == "TermVteField" ] || [ "$projet_bin" == "TermVteGrid" ] || [ "$projet_bin" == "TermVteTest" ] ; then
  	( set -x ; \
    		nim  c -f --gc:orc -d:forceGtk -d:useMalloc  \
			--passc:-flto --passC:-fno-builtin-memcpy \
			--verbosity:0 --hints:off  \
			--threads:on  --app:GUI  \
			--passL:-no-pie -d:release \-o:$projet_bin   $projet_src ; \
	)
  else
  	( set -x ; \
    		nim  c -f --gc:orc -d:useMalloc   \
			--passc:-flto --passC:-fno-builtin-memcpy \
			--verbosity:0 --hints:off  \
			--threads:on \
			 -d:release  \
			-o:$projet_bin   $projet_src ; \
	)
  fi
fi

if [ "$mode" == "TEST" ] ; then
	( set -x ; \
		nim  c -f --gc:orc  -d:useMalloc  --warning[Deprecated]:off \
			--hint[Performance]:off  --warning[Deprecated]:on --warning[EachIdentIsTuple]:on \
			--threads:on \
			--passL:-no-pie \
     	--passL:-lrt \
			-o:$projet_bin   $projet_src ; \
	)
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
