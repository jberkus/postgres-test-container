#!/usr/bin/env bash

echo "export PATH=$PATH:/usr/local/pgsql/bin" >> /home/postgres/.bashrc
echo "export PGDATA=/usr/local/pgsql/data" >> /home/postgres/.bashrc
su postgres -c '/usr/local/pgsql/bin/initdb -k -E UTF8 --locale=C -D /usr/local/pgsql/data'
cp /scripts/config/*.conf /usr/local/pgsql/data/
cp /scripts/config/*.pem /usr/local/pgsql/data/
chown postgres:postgres /usr/local/pgsql/data/* 
chmod 600 /usr/local/pgsql/data/key.pem
su postgres -c '/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data start'
sleep 5
/usr/local/pgsql/bin/psql -U postgres -c "ALTER USER postgres PASSWORD 'postgres'"
/usr/local/pgsql/bin/psql -U postgres -f /scripts/sampledata/libdata.users.sql
/usr/local/pgsql/bin/pg_restore -U postgres -d libdata /scripts/sampledata/libdata.dump
su postgres -c '/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data stop'

exit 0