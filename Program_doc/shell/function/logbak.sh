#!/bin/bash
#编写备份脚本,备份后的文件名包含日期标签,防止后面的备份将前面的备份数据覆盖 
tar -czf log-`tar    -czf    log-`date +%Y%m%d`.tar.gz    /var/log
