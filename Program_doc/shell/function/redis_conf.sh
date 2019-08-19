#!/bin/bash
p=192.168.4.
for i in {52..58}
do
ip=${p}${i}
ssh $ip "/etc/init.d/redis_6379 stop"
ssh $ip "sed -i 's/^port 6379/port 63$i/;s/^bind 127.0.0.1/bind 192.168.4.$i/' /etc/redis/6379.conf"
ssh $ip "/etc/init.d/redis_6379 start"
done
