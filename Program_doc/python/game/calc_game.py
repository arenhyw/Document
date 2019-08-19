from random import randint, choice
def exam():
    nums = [randint(1, 100) for i in range(2)]
    nums.sort(reverse=True)
    op = choice('+-')
    cmds = {'+': lambda x, y: x + y, '-': lambda x, y: x - y}

    result = cmds[op](*nums)
    prompt = ('%s %s %s = ' % (nums[0], op, nums[1]))

    counter = 0

    while counter < 3:
        try:
            answer = input(prompt + '?\n答案: ')
            assert int(answer) in range(0, 201)
        except (AssertionError, ValueError):
            print('要认真答哦~')
        except (KeyboardInterrupt, EOFError):
            print('再努力下, 加油!!!')
            continue

        else:
            if answer == result:
                print('非常棒!!!')
                break
            print('不对哟, 再想想')
            counter += 1
    else:
        print(prompt, result)

def main():
    while True:
        exam()
        try:
            yn = input('Continue(y/n)? ').strip()[0]
        except (KeyboardInterrupt, EOFError):
            yn = 'n'
        except IndexError:
            yn = 'y'

        if yn in 'nN':
            print('\nBey-bey')
            break

if __name__ == '__main__':
    main()
