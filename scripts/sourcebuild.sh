#!/usr/bin/env bash

useradd -m -s "/bin/bash" postgres 
echo "export PATH=$PATH:/usr/local/pgsql/bin" >> /home/postgres/.bashrc

tar -xvzf /scripts/sources/postgresql-9.5alpha1.tar.gz -C /usr/local/src/ 
cd /usr/local/src/postgresql-9.5alpha1
./configure --with-perl --with-python --with-selinux --with-openssl --with-libxml --with-ossp-uuid
make
make install
cd contrib
make
make install

git clone https://github.com/postgrespro/jsquery.git
cd jsquery
make 
make install

chown -R postgres:postgres /usr/local/pgsql

easy_install pgxnclient

exit 0