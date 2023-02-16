# 바이러스 / BFS

import sys
from collections import deque
input = sys.stdin.readline

n = int(input())
m = int(input())
network = [[] for _ in range(n + 1)]
visited = [0 for _ in range(n + 1)]
answer = 0

for _ in range(m):
    u, v = map(int, input().split())
    network[u].append(v)
    network[v].append(u)

q = deque([1])
visited[1] = 1

while q:
    now = q.popleft()

    for i in network[now]:
        if visited[i] == 0:
            visited[i] = 1
            answer += 1
            q.append(i)

print(answer)