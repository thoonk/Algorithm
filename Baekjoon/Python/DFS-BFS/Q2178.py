# 미로 탐색 / BFS
import sys
input = sys.stdin.readline

n, m = map(int, input().split())
maze = []
for i in range(n):
    maze.append(list(map(int, input().strip())))

def solution():
    d = [[-1,0],[1,0],[0,-1],[0,1]]
    q = []
    q.append([0, 0])
    maze[0][0] = 2

    while q:
        r, c = q.pop(0)
        for i in range(4):
            nr = r + d[i][0]
            nc = c + d[i][1]
            
            if 0 <= nr < n and 0 <= nc < m:
                if maze[nr][nc] == 1:
                    q.append([nr, nc])
                    maze[nr][nc] = maze[r][c] + 1
solution()
for i in range(n):
    print(maze[i])
print(maze[n-1][m-1]-1)


