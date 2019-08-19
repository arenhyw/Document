from os import path
from time import strftime
import pickle
def save(fname):
    try:
        amount = int(input('金额: '))
        comment = input('备注: ')
    except (KeyboardInterrupt, EOFError, ValueError):
        print('\n输入有误, 返回菜单')
        return
    date = strftime('%Y-%m-%s')
    with open(fname, 'rb') as fobj:
        records = pickle.load(fobj)
    balance = records[-1][-2] + amount
    records.append([date, amount, 0, balance, comment])
    with open(fname, 'wb') as fobj:
        pickle.dump(records, fobj)
    print('记录成功')

def cost(fname):
    try:
        amount = int(input('金额: '))
        comment = input('备注: ')
    except (ValueError, EOFError, KeyboardInterrupt):
        print('\n输入有误, 返回菜单')
        return
    date = strftime('%Y-%m-%d')
    with open(fname, 'rb') as fobj:
        records = pickle.load(fobj)
    balance = records[-1][-2] - amount
    records.append([date, 0, amount, balance, comment])
    with open(fname, 'wb') as fobj:
        pickle.dump(records, fobj)

def query(fname):
    with open(fname, 'rb') as fobj:
        records = pickle.load(fobj)
    print('{:^10}{:^8}{:^8}{:^8}{:^10}'.format\
('data',  'save', 'cost', 'balance', 'comment'))
    for record in records:
  #      print('{0[0]:^10}{0[1]:^8}{0[2]:^8}{0[3]:^8}{0[4]:^10}'.format(record))
        print('{:^10}{:^8}{:^8}{:^8}{:^10}'.format(*record))

def show_menu():
    fname = 'account.data'
    init_data = [[strftime('%Y-%m-%d'), 0, 0, 10000, 'deposit']]
    if not path.exists(fname):
        with open(fname, 'wb') as fobj:
            pickle.dump(init_data, fobj)
    cmds = {'0': save, '1': cost, '2': query}
    prompt = '''(0) 收入
(1) 支出
(2) 查询
(3) 退出
请输入(0/1/2/3): '''
    while True:
        try:
            choice = input(prompt)
            assert choice  in ['0', '1', '2', '3']
        except (EOFError, KeyboardInterrupt):
            choice = '3'
        except AssertionError:
            print('输入错误, 请重输!')
            continue
        # if choice not in ['0', '1', '2', '3']:
        #     print('无效输入,请重输')
        #     continue

        if choice == '3':
            print('Bey-bey')
            break

        cmds[choice](fname)

if __name__ == '__main__':
    show_menu()
