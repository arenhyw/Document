#!/bin/bash
#输入手机号,默认将 4-7 位屏蔽
read -p "请输入手机号:" phone
a=${#phone}
b=${phone:0:1}
if [[ $phone =~ [0-9]{11} ]]&&[ $b -eq 1 ]&&[ $a -eq 11 ];then
  jiami=`echo $phone |sed -r 's#^(...)(....)(.*)#\1****\3#'`
  echo "您的手机号是$jiami"
else
   echo "error"
fi

