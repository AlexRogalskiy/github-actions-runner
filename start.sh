#!/bin/sh
cp -r ./temp/* ./my-runner/
cd /home/actions-runner/my-runner
./config.sh --url https://github.com/$REPO --token $TOKEN
./run.sh
