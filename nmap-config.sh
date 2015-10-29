#!/usr/bin/env bash

cd /home/vagrant/neteo-core/

gcc run_nmap.c
sudo mv a.out /usr/bin/scanner
sudo chmod a+s /usr/bin/scanner
sudo chmod a+x /usr/bin/scanner