#!/usr/bin/env bash

# Switch to using brew-installed bash as default shell

BASH4_LOCATION='/usr/local/bin/bash'
if [[ ! -f $BASH4_LOCATION ]]; then
  echo "Can't find $BASH4_LOCATION";
  exit 1;
fi

SHELLS_FILE='/etc/shells'
if ! grep -F -q $BASH4_LOCATION $SHELLS_FILE; then
  echo $BASH4_LOCATION | sudo tee -a $SHELLS_FILE;
  chsh -s /usr/local/bin/bash;
fi;
