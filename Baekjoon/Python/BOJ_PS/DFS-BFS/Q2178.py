# 미로 탐색 / BFS
import sys
from collections import deque
input = sys.stdin.readline
n, m = map(int, input().split())
maze = [list(map(int, input().rstrip())) for _ in range(n)]

q = deque([(0, 0)])
d = [[-1, 0], [1, 0], [0, -1], [0, 1]]

while q:
    r, c = q.popleft()
    
    for i in range(4):
        nr = r + d[i][0]
        nc = c + d[i][1]
        
        if 0 <= nr < n and 0 <= nc < m:
            if maze[nr][nc] == 1:
                q.append((nr, nc))
                maze[nr][nc] += maze[r][c]

print(maze[n - 1][m - 1])


