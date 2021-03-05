#!/bin/bash

mkdir -p /tmp/update
cd /tmp/update
git clone https://github.com/codinghusi/glasfaser-borghorst-de
yes | cp ./glasfaser-borghorst-de/public/* /app/data/public
cd /tmp
rm -rf /tmp/update