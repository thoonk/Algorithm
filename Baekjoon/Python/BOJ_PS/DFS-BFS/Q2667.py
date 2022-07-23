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
