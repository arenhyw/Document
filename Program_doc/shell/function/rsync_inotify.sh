#!/bin/bash
while inotifwait -rqq /dir_1/
do
	rsync -az --delete /dir_1/ root@192.168.1.1:/dir_2/
done

