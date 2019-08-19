import re

class CountPatt:
    def __init__(self, fanme):
        self.fname = fname

    def count_patt(self, patt):
        redict = {}
        cpatt = re.compile(patt)

        with open(self.fname) as fobj:
            for line in fobj:
                m = cpatt.search(line)
                if m:
                    key = m.group()
                    redict[key] = redict.get(key, 0) + 1
        relist = list(redict.items())
        relist.sort(key=lambda item: item[-1], reverse=True)

        for result in relist:
            print('%-15s%s' % result)

if __name__ == '__main__':
    fname = 'access_log'
    ip = '^(\d+\.){3}\d+'
    br = 'Firefox|MSIE|Chrome'
    count = CountPatt(fname)
    count.count_patt(ip)
    count.count_patt(br)
