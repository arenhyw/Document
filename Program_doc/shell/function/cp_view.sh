#!/bin/bash
#cp显示进度脚本
aa(){
 while :
        do
          echo -n "#"
          sleep 0.5
        done
}
if [ ! -e $1 ];then
   echo "文件或目录不存在！！！"
else
  aa&
  cp -r $1 $2
  kill $!
  echo 
fi
