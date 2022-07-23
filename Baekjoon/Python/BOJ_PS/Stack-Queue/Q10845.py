# 큐 / 큐 
import sys

input = sys.stdin.readline 
n = int(input()) 
q = []
for _ in range(n):
    cmd = input().split()
    if cmd[0] == 'push':
        q.append(int(cmd[1]))
    elif cmd[0] == 'pop':
        if q: print(q.pop(0))
        else: print(-1)
    elif cmd[0] == 'size':
        print(len(q))
    elif cmd[0] == 'empty':
        if q: print(0)
        else: print(1)
    elif cmd[0] == 'front':
        if q: print(q[0])
        else: print(-1)
    elif cmd[0] == 'back':
        if q: print(q[len(q)-1])
        else: print(-1)
