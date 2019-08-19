#!/bin/bash
#依次向电脑中的每个用户问好,并且说出对方的 UID
for i in $(cat /etc/passwd)
do
a=${i%%:*}
b=${i##*x:}
c=${b%%:*}
echo "你好$a你的uuid是$c"
done
