#!/bin/bash

SCRIPT_DIR=$( dirname -- "${BASH_SOURCE[0]}" )

# start ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

# signin to 1Password CLI
eval $(op signin kirmal)

## declare SSH keys array
declare -a arr=("com.github.mxv2.key" "ru.mail.corp.gitlab.key" "ru.delivery-club.bitbucket.key")

## now loop through the above array
for i in "${arr[@]}"
do
  ## get SSH passphrase from 1Password
  passphrase=$(op get item "$i" | jq --raw-output '.details.password')
  ## try add ssh key to agent
  SSH_PASS=$passphrase DISPLAY=1 SSH_ASKPASS="$SCRIPT_DIR/auto-add-key" ssh-add "/Users/m.kiryanov/.ssh/$i" < /dev/null
  if [ $? -ne 0 ]; then
      echo "Bad passphrase for $i"
  fi
done
