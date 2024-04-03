#!/bin/sh

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    cd /var/www/html/wordpress
    rm -rf /var/www/html/wordpress/*

    wp core download --allow-root
    wp config create --allow-root  --dbname=$DB_NAME --dbuser=$USER_NAME --dbpass=$USER_PASSWORD --dbhost=mariadb:3306

    chmod 600 /var/www/html/wordpress/wp-config.php

    wp core install --allow-root --url=ylabrahm.42.fr --title=YoueMe --admin_user=root --admin_password=$ADMIN_PASSWORD --admin_email=$EMAIL_ADMIN

    chown -R www-data:www-data /var/www/html/
    chmod -R 777 /var/www/html/

    wp user create --allow-root root $EMAIL_ADMIN --role=administrator --user_pass=$ADMIN_PASSWORD --path=/var/www/html/wordpress
    wp user create --allow-root $USER_NAME $EMAIL --role=editor --user_pass=$USER_PASSWORD --path=/var/www/html/wordpress
fi

sleep 1

exec "$@"
