#!/bin/bash

usage="Usage: $0 {previous-deploy-commit} {this-deploy-commit}"

PREVIOUS_DEPLOY_COMMIT=${1?$usage}
shift
THIS_DEPLOY_COMMIT=${1?$usage}
shift

echo "changes from ${PREVIOUS_DEPLOY_COMMIT} to ${THIS_DEPLOY_COMMIT}"

git log \
 --graph \
 --abbrev-commit \
 --decorate \
 --date=relative \
 --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' \
 --first-parent $PREVIOUS_DEPLOY_COMMIT...$THIS_DEPLOY_COMMIT \
 | sed -E 's|^.+[eE][pP][- ]?([0-9]+).+$|https://jira.cru.org/browse/EP-\1|g' \
 | sed -E 's|^.+#([0-9]+).+$|https://github.com/CruGlobal/give-ep-extensions/pull/\1|g' \
 | tail -r;
