# 단지번호 붙이기 / DFS
import sys 
input = sys.stdin.readline

n = int(input())
homes = [list(map(int, input().strip())) for _ in range(n)]
d = [(0,1),(0,-1),(1,0),(-1,0)]
cnt = 0
res = []
visited = [[False for c in range(n)] for r in range(n)]

def dfs(r, c):
    global cnt
    visited[r][c] = True
    cnt += 1

    for i in range(4):
        nr = r + d[i][0]
        nc = c + d[i][1]

        if 0 <= nr < n and 0 <= nc < n:
            if homes[nr][nc] == 1 and not visited[nr][nc]:
                dfs(nr, nc)

for i in range(n):
    for j in range(n):
        if homes[i][j] == 1 and not visited[i][j]:
            cnt = 0
            dfs(i, j)
            res.append(cnt)
print(homes, visited)
res.sort()
print(len(res))
for i in res:
    print(i)

'''
# BFS version
import sys
from collections import deque
input = sys.stdin.readline

def bfs(r, c):
    cnt = 1
    d = [[-1, 0], [1, 0], [0, -1], [0, 1]]
    q.append((r, c))
    visited[r][c] = 1

    while q:
        r, c = q.popleft()
        
        for i in range(4):
            nr = r + d[i][0]
            nc = c + d[i][1]
            
            if 0 <= nr < n and 0<= nc < n:
                if graph[nr][nc] == 1 and visited[nr][nc] == 0:
                    visited[nr][nc] = 1
                    cnt += 1
                    q.append((nr, nc))
                    
    return cnt

n = int(input())
graph = []
for _ in range(n):
    row = list(map(int, input().rstrip()))
    graph.append(row)

q = deque()
visited = [[0 for _ in range(n)] for _ in range(n)] 
answer = []

for i in range(n):
    for j in range(n):
        if graph[i][j] == 1 and visited[i][j] == 0:
            answer.append(bfs(i, j))
            
answer.sort()
print(len(answer))
for a in answer:
    print(a)
'''