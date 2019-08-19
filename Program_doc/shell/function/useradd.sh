#!/bin/bash 

read  ‐p  "请输入用户名: "   user 
if  [   ‐z  $user  ];then 
      echo "您不需输入账户名" 
      exit 2 
fi 
stty  ‐echo 
read  ‐p  "请输入密码: "     pass 
stty  echo 
pass=${pass:‐123456} 
useradd   "$user" 
echo  "$pass"  |  passwd  ‐‐stdin   "$user" 
