#!/bin/bash
user=root
passwd=123456
dbname=genedb
data=`date +%Y%m%d`

[  ! ‐d  /mysqlbackup  ] &&  mkdir  /mysqlbackup 
mysqldump ‐u"$user"  ‐p"$passwd" "$dbname" > /mysqlbackup/"$dbname"‐${date}.sql
