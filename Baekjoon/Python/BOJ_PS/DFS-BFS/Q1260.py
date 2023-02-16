# DFS와 BFS / 그래프

import sys
from collections import deque
sys.setrecursionlimit(10 ** 9)
input = sys.stdin.readline

n, m, start = map(int, input().split())
graph = [[] for _ in range(n + 1)]
visited = [0 for _ in range(n + 1)]

for _ in range(m):
    u, v = map(int, input().split())
    graph[u].append(v)
    graph[v].append(u)

def dfs(graph, visited, start):
    visited[start] = 1
    print(start, end=' ')
    graph[start].sort()
    
    for i in graph[start]:
        if visited[i] == 0:
            dfs(graph, visited, i)

def bfs(graph, visited, start):
    visited[start] = 1
    q = deque([start])
    
    while q:
        now = q.popleft()
        print(now, end=' ')
        graph[now].sort()
        
        for i in graph[now]:
            if visited[i] == 0:
                visited[i] = 1
                q.append(i)

dfs(graph, visited, start)
visited = [0 for _ in range(n + 1)]
print()
bfs(graph, visited, start)  