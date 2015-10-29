#!/usr/bin/env bash

  # List here what is required.
  #
  #
  packages=(php5-snmp, libhtml-parser-perl, libdb-file-lock-perl, libnet-dns-perl, snmp, snmp-mibs-downloader, libsnmp-perl, openjdk-8-jre-headless, nmap)
  # already installed with homestead base : build-essential php5-dev php-pear mongodb-10gen

  # -
  # Install required packages.

  sudo apt-get update

  for package in ${packages[*]}
  do
    sudo apt-get install $package
  done