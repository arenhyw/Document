#!/bin/bash
#使用 expect 工具自动交互密码远程其他主机安装 httpd 软件
host=192.168.4.$1
expect << EOF
spawn ssh root@$host
expect "password:" { send "123456\r" }
expect "#" { send "yum -y install httpd\n"}
expect "#" { send "systemctl restart httpd;systemctl enable httpd\n"}
expect "#" { send "exit\n"}
EOF
echo "$host httpd 服务已经启动"
