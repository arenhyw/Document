#!/bin/bash
disk_size=$(df / |awk '/\//{print $4}')
mem_size=$(free |awk '/Mem/{print $4}') 

while : 
do
if  [  $disk_size  ‐le  512000  ‐a  $mem_size  ‐le  1024000  ];then 
     mail  ‐s  Warning  root  <<EOF 
Insufficient resources,资源不足 
EOF 
fi 
done
