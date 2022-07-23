# 큐2 / 큐
import sys
from collections import deque
input = sys.stdin.readline

q = deque([])
for _ in range(int(input())):
    cmd = input().split()
    if cmd[0] == 'push':
        q.append(cmd[1])
    elif cmd[0] == 'pop':
        print(q.popleft() if q else -1)
    elif cmd[0] == 'size':
        print(len(q))
    elif cmd[0] == 'empty':
        print(1 if not q else 0)
    elif cmd[0] == 'front':
        print(q[0] if q else -1)
    elif cmd[0] == 'back':
        print(q[-1] if q else -1)

