#!/bin/bash
#计算 100 以内能被 3 整除的数之和
sum=0
for i in `seq 100`
do
 a=$[i%3]
 if [ $a -ne 0 ];then
   continue
 else
 let  sum+=i
  fi
done
echo $sum
