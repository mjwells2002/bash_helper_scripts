#!/bin/bash
# install-script.sh installs any .sh script to /usr/local/bin
# usage install-script script.sh

# check if running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#get script filename from arguments
fname=$1
#remove .sh extension
fname_noarg=${fname%.sh}

#copy script to /usr/local/bin without .sh extension
cp $fname /usr/local/bin/$fname_noarg
#change permissions on new file
chmod 775 /usr/local/bin/$fname_noarg

#user feedback
echo $fname installed to /usr/local/bin/$fname_noarg
