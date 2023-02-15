
# 알고리즘 수업 - 너비 우선 탐색 2 / BFS

import sys 
from collections import deque
input = sys.stdin.readline

def bfs(graph, v, visited):
    global order
    q = deque([v]) 
    visited[v] = order
    
    while q:
        now = q.popleft()
        graph[now].sort(reverse=True)
        
        for i in graph[now]:
            if visited[i] == 0:
                order += 1
                visited[i] = order
                q.append(i)

n, m, r = map(int, input().split())
graph = [[] for _ in range(n + 1)]
visited = [0 for _ in range(n + 1)]
order = 1

for _ in range(m):
    u, v = map(int, input().split())
    graph[u].append(v)
    graph[v].append(u)

bfs(graph, r, visited)

for v in visited[1:]:
    print(v)