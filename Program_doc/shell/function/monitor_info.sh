#!/bin/bash
echo -ne "系统负载:\t"
uptime |awk '{print $(NF-2)}' |sed 's/,//'
echo -ne "网卡流量:\t"
ifconfig eth0 |awk '/RX p/{print $5/1024/1024, "MiB"}'
echo	-ne "空闲内存: \t"
free -m |awk '$1=="Mem:"{print $4, "MiB"}'
echo -ne "空余磁盘:\t"
df -h |awk '/\/$/{print $(NF-2)}'
echo -ne "用户数量: \t"
awk 'END{print NR}' /etc/passwd
echo	-ne "登录用户:\t"
who |awk 'END{print NR}'
echo -ne "系统进程数量: \t"
ps aux |awk 'END{print NR}'
echo	-ne "软件包数量:\t"
rpm -qa |awk 'END{print NR}'
