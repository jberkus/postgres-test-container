#!/usr/bin/env bash

echo 'starting provisioning'

# install wget

apt-get update
apt-get -y -q install wget apt-utils

# setup apt-get to pull from apt.postgresql.org

echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main 9.5" > /etc/apt/sources.list.d/pgdg.list
wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -

# update apt
apt-get update
apt-get -y -q install pgdg-keyring

# install some basics
apt-get -y -q install libreadline-dev
apt-get -y -q install less tmux
apt-get -y -q install joe nano vim
apt-get -y -q install gcc make
apt-get -y -q install git

#install dependencies for contrib etc.
apt-get -y -q install libc6-dev libselinux1 libselinux1-dev libssl1.0.0 libssl-dev
apt-get -y -q install libuuid1 libxslt1-dev libxslt1.1 zlib1g-dev zlib1g
apt-get -y -q install libpython2.7 libpython2.7-dev python python-pip
apt-get -y -q install liblua5.1-0-dev liblua5.1-0 libperl5.20 libperl-dev
apt-get -y -q install libstdc++6 libv8-3.14-dev libv8-3.14.5
apt-get -y -q install libossp-uuid-dev
apt-get -y -q install flex bison

# install postgresql and a bunch of accessories
#apt-get -y -q install postgresql-client-9.5
#apt-get -y -q install postgresql-9.5
#apt-get -y -q install postgresql-contrib-9.5
#apt-get -y -q install postgresql-plpython-9.5
#apt-get -y -q install postgresql-pllua-9.5
#apt-get -y -q install postgresql-9.5-server-dev
#apt-get -y -q install pgbouncer

# install PostGIS
#apt-get -y -q install postgresql-9.4-postgis-2.1

# install alternate editor and tmux and other utilities

exit 0
