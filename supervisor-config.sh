#!/usr/bin/env bash

# Add config for Neteo Core Queue system
block="[program:neteo-queue]
command=php artisan queue:work --daemon
directory=/home/vagrant/neteo-core
stdout_logfile=/home/vagrant/neteo-core/app/storage/logs/supervisord.log
redirect_stderr=true
autostart=true
autorestart=true
"

echo "$block" > "/etc/supervisor/conf.d/neteo-queue.conf"

supervisorctl reread  
supervisorctl add neteo-queue
supervisorctl start neteo-queue   

# Update config to access supervisord configuration trought RPC 
block2="[inet_http_server]
port = *:9001
username = user
password = 123
"

sed -i "7i${block2}" /etc/supervisor/supervisord.conf

service supervisor restart