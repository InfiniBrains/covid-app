#!/usr/bin/env bash

# abort on error
set -e

# set env
echo -e "Starting build process"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/../"

$SCRIPTS/installdeps.sh
$SCRIPTS/switch-to-flutter-web.sh
$SCRIPTS/setup-gcloud-ubuntu.sh
$SCRIPTS/build.sh
$SCRIPTS/deploy.sh
