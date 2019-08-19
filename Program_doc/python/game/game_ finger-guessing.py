from random import choice
all_choices = ['石头', '剪刀', '布']
win_list = [['石头', '剪刀'], ['剪刀', '布'], ['布', '石头']]
prompt = '''(0)石头
(1)剪刀
(2)布
请出拳(0/1/2): '''
cwin, pwin = 0, 0
while True:
    computer = choice(all_choices)
    ind = int(input(prompt))
    player = all_choices[ind]
    print("Your choice: %s, Computer's choice: %s" % (player, computer))
    if player == computer:
        print('\033[33;1mDRAW\033[0m')
    elif [player, computer] in win_list:
        print('\033[32;1mWIN\033[0m')
        pwin += 1
    else:
        print('\033[31;1mLOSE\033[0m')
        cwin += 1
    if pwin == 2:
        print('\033[32;1mYOU WIN !!!\033[0m')
        break
    elif cwin == 2:
        print('\033[31;1mYOU LOSE !!!\033[0m')
        break


