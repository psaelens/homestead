#!/usr/bin/env bash

block="\
    \\
    location \/api \{ \\
        proxy_pass http\:\/\/neteo-core\.app\; \\
    \} \\
    "

# Insert block at line 14
sed -i "14i${block}" /etc/nginx/sites-available/neteo-webapp.app

service nginx restart
service php5-fpm restart