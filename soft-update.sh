#!/bin/bash

mkdir -p /tmp/update
cd /tmp/update
git pull https://github.com/codinghusi/glasfaser-borghorst-de
yes | cp ./public/* /app/data/public
cd /tmp
rm -rf /tmp/update