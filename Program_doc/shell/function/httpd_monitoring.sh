#!/bin/bash
#实时监控 HTTP 服务器的状态,服务关闭后发送邮件报警
while :
do
systemctl status httpd | grep running >/dev/null
[ $? -ne 0 ]&& echo "httpd is down" | mail -s "http-error" root
sleep 60
done
