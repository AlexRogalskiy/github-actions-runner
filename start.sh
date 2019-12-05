#!/bin/bash
[ "$(ls -A ./my-runner)" ] && echo "Runner already exists!" || cp -r ./temp/* ./my-runner/
cd /home/actions-runner/my-runner
[ -f .credentials ] && echo "Already configured" || ./config.sh --url https://github.com/$REPO --token $TOKEN
./run.sh
