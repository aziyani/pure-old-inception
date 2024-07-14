#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then
    mkdir -p /var/www/html/
    chmod -R 777    /var/www/html/
    cd /var/www/html/
    chown -R www-data:www-data /var/www/html/

    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar # (client interface) command line that interact with WordPress

    chmod +x wp-cli.phar

    mv wp-cli.phar /usr/local/bin/wcp # move the file to the bin directory where we execute commands

    wcp core download --allow-root

    wcp config create --dbname=${DATABASE} --dbuser=${USERNAME} --dbpass=${USERPASSWORD} --dbhost=mariadb:3306 --allow-root

    wcp core install --url=${WEBSITEURL} --title=inception --admin_user=${SUPERUSERWP} --admin_password=${SUPERUSERPASS} --admin_email=${SUPERUSEREMAIL} --allow-root

    wcp user create $NEWUSERNAME $NEWUSEREMAIL --role=editor --user_pass=$NEWUSERPASS --allow-root # --allow-root = run the command as root

fi

sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf
# -i = edit the file in place if it not exist it just showed the edit result not realy chnage it
# g = global flag, it will replace all the occurences of the string in the file

exec php-fpm8.2 -F # -F = stay in the foreground
# exec = replace the current process with the new process
# php-fpm8.2 = php fast process manager (fast cgi)