#!/usr/bin/env python3
'linux 文档 转 windows 文档'

import sys
import os

def if_exist(srcf, dstf):
    if not os.path.exists(srcf):
        print('%s 文件不存在' % srcf)
    elif os.path.exists(dstf):
        print('%s 文件已存在' % dstf)
    else:
        uix2dos(srcf, dstf)

def uix2dos(srcf, dstf):
    with open(srcf, 'r') as sobj, open(dstf, 'a') as dobj:
        while True:
            data = sobj.readline()
            if not data:
                break
            dobj.write(data.replace('\n','\r\n'))


if __name__ == '__main__':
    srcf = sys.argv[1]
    dstf = sys.argv[2]
    if_exist(srcf, dstf)


