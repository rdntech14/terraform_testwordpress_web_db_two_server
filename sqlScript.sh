#!/bin/bash
yum install -y mysql mysql-server
service mysqld start
yum install -y expect
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"\r\"
expect \"Set root password?\"
send \"Y\r\"
expect \"New password:\"
send \"1234\r\"
expect \"Re-enter new password:\"
send \"1234\r\"
expect \"Remove anonymous users?\"
send \"Y\r\"
expect \"Disallow root login remotely?\"
send \"Y\r\"
expect \"Remove test database and access to it?\"
send \"Y\r\"
expect \"Reload privilege tables now?\"
send \"Y\r\"
expect eof
")

#echo "$SECURE_MYSQL"

service mysqld restart

mysql -u root -p'1234' -e "create database db5";
mysql -u root -p'1234' -e "show databases";
mysql -u root -p'1234' -e "CREATE USER 'user5'@'%' IDENTIFIED BY '1234'";
mysql -u root -p'1234' -e "GRANT ALL PRIVILEGES ON *.* TO 'user5'@'%' WITH GRANT OPTION";
mysql -u root -p'1234' -e "select Host,User from mysql.user";
mysql -u root -p'1234' -e "FLUSH PRIVILEGES";
mysql -u root -p'1234' -e "FLUSH HOSTS;";
service mysqld restart
mysql -u user5 -p'1234';
quit;
