#!/usr/bin/env bash

mkdir -p ~/.homestead

cp src/stubs/Homestead.yaml ~/.homestead/Homestead.yaml
cp src/stubs/after.sh ~/.homestead/after.sh
cp src/stubs/aliases ~/.homestead/aliases

echo "Homestead initialized!"

mkdir -p ~/Projects/Neteo

git clone git@bitbucket.org:psaelens/neteo-core.git
git clone git@bitbucket.org:psaelens/neteo-webapp.git

echo "Neteo initialized!"
echo "Update your /etc/hosts with: "
echo "# Host Neteo "
echo "192.168.10.10	neteo-webapp.app"
echo "192.168.10.10	neteo-core.app"
