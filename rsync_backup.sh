#!/bin/bash

#############################
#############################

## Par William Vincent - william66750 - @ - g m a i l (.) com
## Description : Synchronisation de fichiers avec rsync
## Utilisation :
##  chmod +x ./synchro_folder.sh
##      ./synchro_folder.sh

#############################
#############################

####################################
### Fonctions
##################

display_help()
{
    echo "SYNCHRO /var/www/ "
    echo "######################## "
    echo " Le programme sans argument simule la synchronisation"
    echo " Si vous êtes sur de la configuration, utilisez -r ou --run pour effectuer la synchronisation"
}

####################################
### Variables
##################

# Variables Dossiers
SERVEURDISTANT="root@domaine.fr"
DOSSIER_SOURCE="/var/www/"
DOSSIER_DESTINATION="/Users/William/Documents/Backup/var/www/"

# Options rsync
OPTIONS="-chavzP "

# Exclusion
#FILTER_HOME=" --exclude .sauve/ --exclude .old/ "
FILTER_HOME=" "

####################################
### Main
##################


# Si pas d'options
# Simulation : ( Sans l'option adéquate, les fichiers ne sont pas transférés )
if [ "$#" -ne 1 ]; then
    DRYRUN=" --dry-run "
    MESSAGE=" ==> La Synchronisation SIMULER ( -h pour l'aide )  "
fi

# Test des arguments
while :
do
    case "$1" in
      -r | --run)
          DRYRUN="  "
          MESSAGE=" ==> Synchronisation : OK ! "
      shift 1
      ;;
      -h | --help)
      display_help
      exit 0
      ;;
       *)
      break
      ;;
    esac
done


# On se rend dans le dossier à synchro
#cd $DOSSIER_SOURCE
cd $DOSSIER_DESTINATION

# Action
echo "Lancement de la synchro"
echo "rsync $OPTIONS -e 'ssh -p 22' $DRYRUN $FILTER_HOME $SERVEURDISTANT:$DOSSIER_SOURCE $DOSSIER_DESTINATION"
rsync $OPTIONS -e 'ssh -p 22' $DRYRUN $FILTER_HOME $SERVEURDISTANT:"$DOSSIER_SOURCE" "$DOSSIER_DESTINATION"

# On affiche le message
echo $MESSAGE
