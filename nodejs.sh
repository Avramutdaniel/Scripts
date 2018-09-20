#!/bin/bash

#Changing user to root
if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

#Installing NodeJS
apt-get update
sudo apt-get install nodejs

sudo apt-get install -y build-essential

 
NODE_JS="$(nodejs --version)"
echo ${NODE_JS}
if [[ "$NODE_JS" == "nodejs --version"* ]]; then
    echo "Nodejs is installed"
  else
    echo "Nodejs is NOT installed"
fi

echo 'Congratulation !!! The installation was succesfull finished !!!'
