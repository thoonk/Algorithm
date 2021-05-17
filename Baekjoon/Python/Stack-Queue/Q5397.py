# 키로거 / 스택
import sys
input = sys.stdin.readline

for _ in range(int(input())):
    left = []
    right = []
    l = input().strip()
    for str in l:
        if str == '<':
            if left:
                right.append(left.pop())
        elif str == '>':
            if right:
                left.append(right.pop())
        elif str == '-':
            if left:
                left.pop()
        else:
            left.append(str)
    print(''.join(left) + ''.join(reversed(right)))