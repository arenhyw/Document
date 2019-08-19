#!/bin/bash
#实时监控/分区剩余空间,根分区使用量大于 70%时,发送报警邮件给 root 管理员
while :
do
a=`df -Th | grep /$|sed 's/ /#/g'`
b=${a%\%*}
df=${b##*\#}
[ $df -ge 70 ] && echo "根分区空间不足,已使用$df%" | mail -s 'error' root
sleep 60
done
