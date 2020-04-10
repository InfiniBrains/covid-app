#!/usr/bin/env bash

# abort on error
set -e

# sourcing
echo -e "Sourcing"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/.."
source $SCRIPTS/dev.env

#rm -rf $PROJECT/pubspec.yaml
#cp $PROJECT/pubspec.web.yaml $PROJECT/pubspec.yaml

#find $PROJECT/lib/ \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/package\:flutter\//package\:flutter_web\//g'
#rm -rf "$PROJECT/web/main.dart"
#cp "$PROJECT/web/main.txt" "$PROJECT/web/main.dart"
#cd "$PROJECT/test_driver" ; rename "s/dart/txt/" *

echo -e "$RED cleaning caches $NC"
rm -rf "$HOME/.pub-cache/"
cd $PROJECT ; flutter clean 2> /dev/null & disown

echo -e "$RED changing channel to master $NC"
flutter channel master
flutter upgrade
flutter config --enable-web
flutter doctor

echo -e "$RED getting packages $NC"
cd $PROJECT ; flutter packages pub global activate webdev
cd $PROJECT ; flutter pub get packages