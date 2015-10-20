#!/bin/bash

#############################
#############################
  
## Par William Vincent - william66750 - @ - g m a i l (.) com
## Description : Générateur de mot de passe 
## Utilisation : 
##	chmod +x ./genPasswd.sh
##      ./genPasswd.sh
##	- Sans argument : un mot de passe de 8 caracteres
##      - Definir un nombre de caracteres : -c=18
  
#############################
#############################



##################
### Variables
################## 
NBCHAR=8
 
##################
### Arguments
################## 
for i in "$@"
do
case $i in
    -c=*|--count=*)
    	NBCHAR="${i#*=}"
    shift
    ;;
    *)
        NBCHAR=8
    ;;
esac
done
 
##################
### Main
##################
echo "#### Utilisation :"
echo "Pour changer le nombre de caractere : -c=10 ou -c=18 ( default 8 ) "
echo "Nombre de caracteres : $NBCHAR"
 
 
dd if=/dev/urandom bs=1 count=200 2>/dev/null | tr -dc '12345!@#$azerty1u!i2o#p3wx4@cvb5nQ!6@SD7FGH!8JK@9LM6nb#v6cx5xw!@aPBOItUYTREZAasx67890' | head -c$NBCHAR; echo
