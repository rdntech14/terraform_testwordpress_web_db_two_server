#!/bin/bash
yum install -y httpd php php-mysql mysql
service httpd start
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress testwordpress
cd testwordpress/
mv wp-config-sample.php wp-config.php
sed -i "s/database_name_here/db5/g" wp-config.php
sed -i "s/username_here/user5/g" wp-config.php
sed -i "s/password_here/1234/g" wp-config.php
sed -i "s/localhost/${db_public_ip}/g" wp-config.php
service httpd restart
