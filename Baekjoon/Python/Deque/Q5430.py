# AC / 덱, 구현, 문자열, 파싱
import sys
input = sys.stdin.readline

def oprt(nums, p, n):
    isReversed = False
    front = 0
    rear = 0

    if n < p.count('D'):
        return 'error'
    
    for cmd in p:
        if cmd == 'R':
            isReversed = not isReversed
        elif cmd == 'D':
            if isReversed == False:
                front += 1
            else:
                rear += 1
    
    if front + rear <= n:
        res = nums[front:(n-rear)]
        if isReversed == True:
            res = reversed(res)
        return '[' + ','.join(res) + ']'
    else:
        return 'error'

for _ in range(int(input())):
    p = input()
    n = int(input())
    nums = input().strip()[1:-1].split(',')
    print(oprt(nums, p, n))

