# 알고리즘 수업 - 너비 우선 탐색 1 / BFS

import sys
from collections import deque
input = sys.stdin.readline

def bfs(graph, v, visited): 
    global order
    q = deque([v])
    visited[v] = order

    while q:
        now = q.popleft()
        graph[now].sort()
        for i in graph[now]:
            if visited[i] == 0:
                order += 1
                q.append(i)
                visited[i] = order

n, m, r = map(int, input().split())
graph = [[] for _ in range(n + 1)] 
visited = [0 for _ in range(n + 1)]
order = 1

for _ in range(m): 
    u, v = map(int, input().split())
    graph[u].append(v)
    graph[v].append(u)
    
bfs(graph, r, visited)
for i in range(1, n + 1):
    print(visited[i])
