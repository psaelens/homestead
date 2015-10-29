#!/usr/bin/env bash

sudo npm install forever -g

cd /home/vagrant/neteo-core/nodejs/

npm install express redis socket.io --save

forever start -a -l /home/vagrant/neteo-core/app/storage/logs/websocket.log server.js