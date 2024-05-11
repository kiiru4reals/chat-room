#!/bin/sh
file_name=${GITHUB_WORKSPACE}/gcp/key.json.gpg

gpg --quiet --batch --yes --decrypt --passphrase="$GCP_SERVICE_ACCOUNT_PASSPHRASE" --output ${GITHUB_WORKSPACE}/gcp/key.json $file_name