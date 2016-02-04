#!/bin/bash

#############################
#############################

## Par William Vincent - william66750 - @ - g m a i l (.) com
## Description : Sauvegarder toutes ces bases de données mysql ou mariadb
## Utilisation :
##  chmod +x ./backup_all_mysql.sh
##  ./backup_all_mysql.sh
## Cron tous les jours à minuit:
## crontab -e
## 0 0 * * * /data/scripts/backup_all_mysql.sh

#############################
#############################


USER="root"
PASSWD="pass"
TYPESQL="mysql" #ou mariadb
TYPESQLDUMP="mysqldump" #ou mariadbdump
DOSSIERDEBACKUP="/home/backup/sql/"

#date du jour
DATE=`date +%y_%m_%d`

#liste des bases
LISTEDB=$( echo 'show databases' | $TYPESQL -u$USER -p$PASSWD )

#on backup toutes les bases
for SQL in $LISTEDB
do
  #on ne prend pas certaines bases 
  if [ $SQL != "information_schema" ] && [ $SQL != "mysql" ] &&  [ $SQL != "performance_schema" ] && [ $SQL != "Database" ]; then
    $TYPESQLDUMP -u$USER -p$PASSWD $SQL | gzip > $DOSSIERDEBACKUP$SQL$TYPESQL$DATE.sql.gz
  fi
done

