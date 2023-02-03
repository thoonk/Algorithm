# 특정 거리의 도시 찾기 / BFS
import sys
from collections import deque

input = sys.stdin.readline
N, M, K, X = map(int, input().split())
graph = [[] for i in range(N + 1)]
distance = [-1] * (N + 1)
distance[X] = 0
q = deque([X])

for _ in range(M):
    A, B = map(int, input().split())
    graph[A].append(B)

while q:
    now = q.popleft()
    for next in graph[now]:
        if distance[next] == -1:
            distance[next] = distance[now] + 1
            q.append(next)

flag = 0
for i, dist in enumerate(distance):
    if dist == K:
        print(i)
        flag = 1
if not flag:
    print(-1)

