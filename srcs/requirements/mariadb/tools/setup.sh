#!/bin/sh

cat << EOF > /home/data/tools/init.sql
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ADMIN_PASSWORD}';
FLUSH PRIVILEGES;
CREATE USER '${USER_NAME}'@'localhost' IDENTIFIED BY '${USER_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${USER_NAME}'@'%' IDENTIFIED BY '${USER_PASSWORD}' ;
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
FLUSH PRIVILEGES;
EOF

mariadbd --user=root --bootstrap < /home/data/tools/init.sql
sleep 2

exec "$@"