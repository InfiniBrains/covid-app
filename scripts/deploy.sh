#!/usr/bin/env bash
# based on https://cloud.google.com/storage/docs/hosting-static-website

# abort on error
set -e

# sourcing
echo -e "Sourcing"
SCRIPTS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT="$SCRIPTS/../"
source $SCRIPTS/dev.env

firebase deploy --token "$FIREBASE_TOKEN"

#echo -e "$RED Decoding google key $NC"
#echo $SERVICE_ACCOUNT_BASE64 | base64 --decode > /tmp/$CI_PIPELINE_ID.json
#
#echo -e "$RED Loging into google account $NC"
#gcloud auth activate-service-account --key-file /tmp/$CI_PIPELINE_ID.json
#rm /tmp/$CI_PIPELINE_ID.json
#
##gsutil defacl ch -u AllUsers:R gs://$GOOGLEBUCKET
#cd $PROJECT/build ; gsutil -m rsync -R . gs://$GOOGLEBUCKET
##gsutil acl ch -u AllUsers:R gs://$GOOGLEBUCKET/**