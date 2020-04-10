#!/usr/bin/env bash

# abort on error
set -e

# set env
echo -e "Sourcing"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/../"
source $SCRIPTS/dev.env

# clone flutter
echo -e "$RED Clonning flutter $NC"
if [[ ! -d $HOME/flutter/ ]] ; then
    git clone --quiet https://github.com/flutter/flutter $HOME/flutter/
else
    cd $HOME/flutter/ ; git fetch --all ; git reset --hard origin/master
    cd $HOME/flutter/ ; git pull
fi

echo -e "$RED Activating flutter $NC"
flutter channel master
flutter upgrade
flutter config --enable-web
flutter doctor

