#!/bin/bash
echo -ne "系统负载:\t"
uptime |awk '{print $}'
