#!/bin/bash

fdBlanc='\033[47;1m'
fcNoir='\033[30m'

f_dsply(){
	echo -en '\033[0;0m'
	echo  -e $1
	echo -en '\033[0;0m'
}

f_read() {	
	echo -en '\033[0;0m'
	echo -en $fdBlanc$fcNoir
	read
	echo -en '\033[0;0m'
}
f_clear() {
reset > /dev/null
	echo -en '\033[1;1H'
	echo -en '\033]11;#000000\007'
	echo -en '\033]10;#FFFFFF\007'
}

requete="?"





while [ "$requete" == "?" ]; do
  f_dsply 'veuilez donnez le critère de recherhe:'
  f_read
  requete=$REPLY
  if [  -z $requete  ]; then
    f_dsply 'erreur de saisie';
    read -s -n 1
    f_clear
    requete="?"
  fi
  

done
requete=$REPLY
grep -B2 --color=auto $requete ~/.nimble/pkgs/gintro-0.7.7/gintro/*

#json runTerminalCommand.commands
#"xfce4-terminal --title=GREP --hold --geometry 160x20 --zoom=2 -e '/home/soleil/NIMGUI/GUISQL/grep_gtknim.sh ?*'"
exit 0
