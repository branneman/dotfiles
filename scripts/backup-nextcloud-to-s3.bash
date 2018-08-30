#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root" 
   exit 1
fi

source_dir="/var/www/nextcloud"
stamp=`date +"%Y-%m-%d"`
backups="/var/backups/nextcloud"
backup_dir="${backups}/${stamp}"
backup_s3="nextcloud-backups"

db_name=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbname\"]);")
db_host=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbhost\"]);")
db_user=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbuser\"]);")
db_pass=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbpassword\"]);")

echo "Backup starting..."
sudo -u www-data "${source_dir}/occ" maintenance:mode --on
mkdir -p $backup_dir

echo "Backing up database..."
sudo mysqldump --single-transaction -h $db_host -u $db_user -p$db_pass $db_name > "${backup_dir}/db.sql"

echo "Backing up files..."
rsync -avx "${source_dir}/" "${backup_dir}/files"

echo "Sync to S3..."
# TODO: Delete local folders that are older than a week
aws s3 sync --delete $backups "s3://${backup_s3}"

sudo -u www-data "${source_dir}/occ" maintenance:mode --off
echo "Backup finished."
