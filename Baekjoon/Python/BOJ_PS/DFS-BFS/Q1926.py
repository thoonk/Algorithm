# 그림 / DFS-BFS
import sys
input = sys.stdin.readline

n,m = map(int, input().split())
paper = [list(map(int, input().split())) for _ in range(n)]
check = [[0] * m for _ in range(n)]
res = []

def solution(r, c):
    d = [[-1,0],[1,0],[0,1],[0,-1]]
    q = [(r,c)]
    cnt = 1
    check[r][c] = 1 

    while q:
        r, c = q.pop()
        for i in range(4):
            nr = r + d[i][0] 
            nc = c + d[i][1]

            if 0 <= nr < n and 0<= nc < m:
                if paper[nr][nc] == 1 and check[nr][nc] == 0:
                    q.append((nr, nc))
                    check[nr][nc] = 1
                    cnt += 1
    return cnt

for r in range(n):
    for c in range(m):
        if paper[r][c] == 1 and check[r][c] == 0:
            res.append(solution(r,c))
print(len(res))
print(max(res) if len(res) > 0 else 0)
