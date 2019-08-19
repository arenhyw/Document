#!/bin/bash
#cd mysql
#[ -d mysql-5.7.17 ] || tar -xf mysql-5.7.17.tar
#yum -y install mysql-community*.rpm
#systemctl start mysqld
#sed -i '/\[mysqld\]/a validate_password_length=6\nvalidate_password_policy=0' /etc/my.cnf
systemctl restart mysqld
pass=`grep password /var/log/mysqld.log |awk 'NR==1{print $NF}'`
#echo " alter user root@'localhost' identified by '123456'" |mysql -uroot -p"'$pass'"
#yum -y install expect
#expect <<EOF
#spawn mysql -uroot -p$pass
#expect "mysql>" {send "alter user root@'localhost' identified by '123456';\r"}
#expect "mysql>" {send "exit;\r"}
#EOF
mysql --connect-expired-password -p$pass -e "alter user root@'localhost' identified by '123456'"
