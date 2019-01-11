#!/usr/local/bin/bash

cd /usr/local/etc/bash_completion.d
ln -s -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
ln -s -f /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
ln -s -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
