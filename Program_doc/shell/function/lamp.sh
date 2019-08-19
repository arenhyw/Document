#!/bin/bash
yum ‐y install httpd 
yum ‐y install mariadb mariadb‐devel mariadb‐server 
yum ‐y install php  php‐mysql 
 
systemctl start httpd mariadb 
systemctl enable httpd mariadb 
