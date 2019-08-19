#!/bin/bash
name=(openstack nova01 nov02)
for i in  {0..2}
do 
	ssh 192.168.1.1${i} 'growpart /dev/vda 1'
	ssh 192.168.1.1${i} 'xfs_growfs /' &
	ssh 192.168.1.1${i} "hostnamectl set-hostname ${name[$i]}"
	ssh 192.168.1.1${i} 'echo "192.168.1.10 openstack
	192.168.1.11 nova01
	192.168.1.12 nova02" >/etc/hosts'
#	ssh 192.168.1.1${i} "sed -i '/search/d' /etc/resolv.conf"
done
