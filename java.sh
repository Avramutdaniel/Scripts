#!/bin/bash

#Changing to root
if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi

DIR="$( cd "$( dirname "$0" )" && pwd )"
JAVA_INSTALL_DIR="/usr/bin/java"

#Create the java install dir
mkdir -p $JAVA_INSTALL_DIR

#update the package index
apt-get uptdate

apt-get install default-jre default-jdk -y

#Installing the Oracle JDK

add-apt-repository ppa:webupd8team/java
apt-get update

#jdk 8

apt-get install oracle-java8-installer -y

#JDK location 
jdkLocation="$JAVA_INSTALL_DIR/$JDK_NAME"

#set environments
echo "JRE_HOME=$jdkLocation" >> /etc/profile
echo 'PATH=$PATH:$JRE_HOME/bin' >> /etc/profile
echo 'export JRE_HOME' >> /etc/profile
echo 'export PATH' >> /etc/profile

update-alternatives --install "/usr/bin/java" "java" "$jdkLocation/bin/java" 1

update-alternatives --set java $jdkLocation/bin/java


echo "java installed at "$jdkLocation
echo "$OK JDK configured successfully"~

