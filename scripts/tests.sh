#!/usr/bin/env bash

# abort on error
set -e

# set snap folder
echo -e "Sourcing"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/../"
source "$SCRIPTS/dev.env"

# ensure it is mobile
/usr/bin/env bash "$SCRIPTS/switch-to-flutter-mobile.sh"

# print tools version
echo -e "$RED Printing tools version $NC"
flutter --version
dart --version
webdev --version

cd "$PROJECT" ; flutter drive --target=test_driver/app.dart