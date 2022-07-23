# 에디터 / 스택
import sys

input = sys.stdin.readline
left = list(input().strip())
right = []

n = int(input())
for _ in range(n):
    cmd = input()
    if cmd[0] == 'L' and left:
        right.append(left.pop())
    elif cmd[0] == 'D' and right:
        left.append(right.pop())
    elif cmd[0] == 'B' and left:
        left.pop()
    elif cmd[0] == 'P':
        left.append(cmd[2])

print(''.join(left+list(reversed(right))))
