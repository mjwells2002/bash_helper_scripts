#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

fname=$1
fname_noarg=${fname%.sh}

cp $fname /usr/local/bin/$fname_noarg
chmod 775 /usr/local/bin/$fname_noarg

echo $fname installed to /usr/local/bin/$fname_noarg
