# 유기농 배추 / BFS
import sys
from collections import deque
input = sys.stdin.readline

d = [[1, 0], [-1, 0], [0, 1], [0, -1]]

def bfs(r, c):
    q = deque()
    q.append((r, c))
    graph[r][c] = 0
    
    while q:
        r, c = q.popleft()
        
        for i in range(4):
            nr = r + d[i][0]
            nc = c + d[i][1]

            if 0 <= nr < n and 0 <= nc < m:
                if graph[nr][nc] == 1:
                    graph[nr][nc] = 0
                    q.append((nr, nc))

for _ in range(int(input())):
    m, n, k = map(int, input().split())
    graph = [[0 for _ in range(m)] for _ in range(n)]
    answer = 0
    
    for _ in range(k):
        c, r = map(int, input().split())
        graph[r][c] = 1
        
    for i in range(n):
        for j in range(m):
            if graph[i][j] == 1:
                bfs(i, j)
                answer += 1
    print(answer)