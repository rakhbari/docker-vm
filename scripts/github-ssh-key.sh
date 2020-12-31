#!/bin/bash

personal_access_token=$1
if [ -z $personal_access_token ]; then
  echo "ERROR: Must provide your GitHub personal access token."
  echo "Please see http://go/github-personal-access-tokens"
  exit 1
fi

public_key_file=~/.ssh/id_rsa.pub

if [ ! -f $public_key_file ]; then
  echo "ERROR: Unable to locate public key file ${public_key_file}"
  echo "Please use ssh-keygen to create a SSH public key pair first."
  exit 2
fi

echo '======================================='
echo '=== Creating GitHub SSH Key ...'
echo '======================================='
curl -X POST \
  -H "Authorization: token ${personal_access_token}" \
  -H "Content-Type: application/json" \
  -d "{\"title\":\"$(hostname)_$(date +%Y%m%d%H%M%S)\", \"key\":\"$(cat ${public_key_file})\"}" \
  https://github.corp.ebay.com/api/v3/user/keys
ret_code=$?

if [ $ret_code -gt 0 ]; then
  echo "ERROR: GitHub API call was not successful."
  echo "Please see above for any error messages."
fi

exit $ret_code
