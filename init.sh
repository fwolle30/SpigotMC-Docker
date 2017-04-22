#!/bin/bash
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
apt-get update
apt-get -y install git debconf-utils

echo "oracle-java8-installer  oracle-java8-installer/not_exist        error" >> settings.conf
echo "oracle-java8-installer  shared/present-oracle-license-v1-1      note" >> settings.conf
echo "oracle-java8-installer  shared/accepted-oracle-license-v1-1     boolean true" >> settings.conf
echo "oracle-java8-installer  oracle-java8-installer/local    string" >> settings.conf
echo "oracle-java8-installer  shared/error-oracle-license-v1-1        error" >> settings.conf

debconf-set-selections < settings.conf

apt-get -y install oracle-java8-installer

git config --global --unset core.autocrlf