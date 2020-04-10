#!/usr/bin/env bash

# abort on error
set -e

# set snap folder
echo -e "Sourcing"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/../"
source $SCRIPTS/dev.env

# print tools version
echo -e "$RED Printing tools version $NC"
flutter --version
dart --version
#webdev --version

echo -e "$RED Clearing Pubspec $NC"
cd $PROJECT ; rm -rf pubspec.lock

echo -e "$RED Flutter pub get $NC"
cd $PROJECT ; flutter pub get packages
#cd $PROJECT ; flutter packages pub run build_runner build lib

echo -e "$RED Building web $NC"
cd $PROJECT ; flutter build web --release

#echo -e "$RED Building linux desktop $NC"
#cd $PROJECT ; flutter build linux
#
echo -e "$RED Building android $NC"
cd $PROJECT ; flutter build appbundle
cd $PROJECT ; flutter build apk

cd $PROJECT ; cp build/app/outputs/apk/release/app-release.apk build/web/
cd $PROJECT ; cp build/app/outputs/bundle/release/app-release.aab build/web/


