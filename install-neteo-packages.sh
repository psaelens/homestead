  # List here what is required.
  #
  # build-essential is maybe overkill ..
  #
  packages=(php5-snmp libhtml-parser-perl libdb-file-lock-perl libnet-dns-perl)
  # already installed with homestead base : build-essential php5-dev php-pear mongodb-10gen

  # -
  # Install required packages.


  for package in ${packages[*]}
  do
    apt-get install $package
  done