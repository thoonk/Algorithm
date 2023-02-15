# 알고리즘 수업 - 깊이 우선 탐색2 / DFS
import sys
sys.setrecursionlimit(10 ** 9)
input = sys.stdin.readline

def dfs(graph, visited, v):
    global order
    visited[v] = order
    
    for i in graph[v]: 
        if visited[i] == 0:
            order += 1
            dfs(graph, visited, i)
    

n, m, r = map(int, input().split())
visited = [0 for _ in range(n + 1)]
graph = [[] for _ in range(n + 1)]
order = 1

for _ in range(m): 
    u, v = map(int, input().split())
    graph[u].append(v)
    graph[v].append(u)
    
for i in range(1, n + 1):
    graph[i].sort(reverse=True)

dfs(graph, visited, r)
for i in range(1, n + 1):
    print(visited[i])