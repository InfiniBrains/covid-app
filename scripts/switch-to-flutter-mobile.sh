#!/usr/bin/env bash

# abort on error
set -e

# sourcing
echo -e "Sourcing"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/.."
source "$SCRIPTS/dev.env"

#rm -rf "$PROJECT/pubspec.yaml"
#cp "$PROJECT/pubspec.mobile.yaml" "$PROJECT/pubspec.yaml"

# in order to run this command on mac you need to install sed. brew install gnu-sed. and add it to path var. export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
#find "$PROJECT/lib" \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i 's/package\:flutter_web/package\:flutter/g'
#rm -rf "$PROJECT/web/main.dart"
#cd "$PROJECT/test_driver" ; rename "s/txt/dart/" *

echo -e "$RED cleaning pub-cache $NC"
rm -rf "$HOME/.pub-cache/"
cd "$PROJECT" ; flutter clean 2> /dev/null & disown

echo -e "$RED changing channel to master $NC"
flutter channel master
flutter upgrade
flutter doctor

echo -e "$RED getting packages $NC"
cd "$PROJECT" ; flutter pub get packages