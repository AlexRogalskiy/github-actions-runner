#!/bin/sh
./config.sh remove --token $TOKEN
./config.sh --url https://github.com/$REPO --token $TOKEN
./run.sh
