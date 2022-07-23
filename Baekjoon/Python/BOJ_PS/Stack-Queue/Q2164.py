# 카드2 / 큐
import sys
from collections import deque

q = deque([])
for i in range(1, int(sys.stdin.readline())+1):
    q.append(i)

while len(q) > 1:
    q.popleft()
    q.append(q.popleft())
print(q.popleft())