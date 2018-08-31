#!/bin/bash

$(boot2docker shellinit)

# but override this, because of our vpn issues
export DOCKER_HOST=tcp://boot2docker:2376

