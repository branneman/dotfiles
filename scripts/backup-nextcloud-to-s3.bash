#!/bin/bash

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root" 
    exit 1
fi

# Within cron, $HOME is / when root, instead of /root
if [ "$HOME" == "/" ]; then
    export HOME="/root"
fi

aws="/root/.local/bin/aws"
source_dir="/var/www/nextcloud"
stamp=`date +"%Y-%m-%d"`
backups="/var/backups/nextcloud"
backup_dir="${backups}/${stamp}"
backup_s3="nextcloud-backups"

db_name=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbname\"]);")
db_host=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbhost\"]);")
db_user=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbuser\"]);")
db_pass=$(php -r "include \"${source_dir}/config/config.php\";echo(\$CONFIG[\"dbpassword\"]);")

echo "Deleting expired backups..."
ls $backups | sort | head -n -3 | xargs -n1 -I %s rm -rf "${backups}/%s"

echo "Backup starting..."
mkdir -p $backup_dir

echo "Backing up database..."
sudo -u www-data "${source_dir}/occ" maintenance:mode --on
sudo mysqldump --single-transaction -h $db_host -u $db_user -p$db_pass $db_name > "${backup_dir}/db.sql"

echo "Backing up files..."
rsync -ax "${source_dir}/" "${backup_dir}/files"
sudo -u www-data "${source_dir}/occ" maintenance:mode --off

echo "Sync to S3..."
aws s3 sync --delete --quiet $backups "s3://${backup_s3}"

echo "Backup finished."
