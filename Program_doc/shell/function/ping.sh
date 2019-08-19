#!/bin/bash
#多线程 ping 一个网段
p(){
ping -c2 -w0.3 192.168.4.$i &> /dev/null
 if [ $? -eq 0 ];then
    echo "192.168.4.$i up"
 else
   echo " 192.168.4.$i down" 
 fi
}
for i in {1..254}
do
 p $i&
  
done

