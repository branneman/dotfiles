#!/bin/bash

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root"
    exit 1
fi
if ! [ -x "$(command -v git)" ]; then
    printf "\nThis script requires git!\n"
    exit 1
fi
if ! [ -x "$(command -v node)" ]; then
    printf "\nThis script requires node!\n"
    exit 1
fi

# Install gandi dns updater
INSTALL_NAME="gandi-update-dns-record"
INSTALL_PATH="/usr/local/lib/${INSTALL_NAME}"
SOURCE_CODE="https://gist.github.com/842ce03721d474a61d3f68036486d568.git"
git clone $SOURCE_CODE $INSTALL_PATH
cd $INSTALL_PATH
npm install
ln -s "${INSTALL_PATH}/index.js" "/usr/bin/${INSTALL_NAME}"

# Configure installation
echo "Enter API KEY:"
read GANDI_API_KEY
echo "Enter base domain name:"
read GANDI_DOMAIN
ENV="{
    \"apikey\": \"${GANDI_API_KEY}\",
    \"domain\": \"${GANDI_DOMAIN}\"
}"
echo $ENV > "${INSTALL_PATH}/.env.json"

# Run on boot and run now
{ crontab -l; echo "@reboot ${INSTALL_NAME}"; } | crontab -
$INSTALL_NAME
