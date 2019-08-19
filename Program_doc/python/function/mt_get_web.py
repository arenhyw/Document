import wget
import os
import re
from urllib import request, error
import threading

def download(url, fname):
    html = request.urlopen(url)
    with open(fname, 'wb') as fobj:
        while True:
            data = html.read(4096)
            if not data:
                break
            fobj.write(data)
def dli(url, fname):
    wget.download(url, fname)

if __name__ == '__main__':
    download_dir = '/tmp/163'
    if not os.path.exists(download_dir):
        os.mkdir(download_dir)

    url163 = 'http://www.163.com'
    fname163 = '/tmp/163/163.html'
    if not os.path.exists(fname163):
        download(url163, fname163)

    img_list = []
    img_patt = '(http|https)://[-./\w]+\.(jpg|jpeg|png|gif)'
    cpatt = re.compile(img_patt)
    with open(fname163, encoding='gbk') as fobj:
        for line in fobj:
            m = cpatt.search(line)
            if m:
                durl = m.group()
                try:
                    t = threading.Thread(
target=dli, args=(durl, download_dir)
)
                    t.start()
                except error.HTTPError:
                    pass
