#!/bin/bash 
#mkdir  /data/scripts 
#vim   /data/scripts/nginx_log.sh  
logs_path="/usr/local/nginx/logs/" 
mv ${logs_path}access.log ${logs_path}access_$(date ‐d "yesterday" +"%Y%m%d").log 
kill ‐USR1  `cat /usr/local/nginx/logs/nginx.pid` 
