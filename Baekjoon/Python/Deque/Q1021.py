# 회전하는 큐 / 덱
import sys
from collections import deque
input = sys.stdin.readline 

n, m = map(int, input().split())
q = deque([i for i in range(1, n+1)])
indices = list(map(int, input().split()))
res = 0

for index in indices:
    while True:
        if index == q[0]:
            q.popleft()
            break
        else:
            if q.index(index) <= len(q) // 2:
                q.rotate(-1)
            else:
                q.rotate(1)
            res += 1
print(res)
