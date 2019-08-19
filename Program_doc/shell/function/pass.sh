#!/bin/bash
#生成随机密码(可以写出多种方法)
x=0
for i in {a..z}
do
o[$x]=$i
let x++
done
x=27
for i in {A..Z}
do
o[$x]=$i
let x++
done
x=53
for i in {0..9}
do
o[$x]=$i
let x++
done
for i in {1..8}
do
n=$[RANDOM%62+1]
PASS=$PASS${o[$n]}
done
echo $PASS
