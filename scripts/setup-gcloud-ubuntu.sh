#!/usr/bin/env bash

# abort on error
set -e

# set env
echo -e "Sourcing"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/../"
source $SCRIPTS/dev.env

echo -e "$RED Installing google sdk $NC"
# to fix bug with snap https://github.com/anbox/anbox/issues/400
sudo chown root:root /
sudo apt update
sudo apt install -y snapd
sudo snap install google-cloud-sdk --classic
#gcloud components update -q

sudo apt-get install -y gcc python-dev python-setuptools python-pip
sudo pip install --no-cache-dir -U crcmod
