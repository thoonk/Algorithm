# 테트로미노 / 구현
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
paper = [list(map(int, input().split())) for _ in range(n)]
check = [[0] * m for _ in range(n)]
d = [[-1,0],[0,-1],[1,0],[0,1]]
ex_d = [
    [(0,0),(0,1),(0,2),(1,1)],
    [(0,0),(1,0),(2,0),(1,1)],
    [(0,0),(0,1),(0,2),(-1,1)],
    [(0,0),(0,1),(-1,1),(1,1)]
]
res = 0

def dfs(cnt, sum, r, c):
    global res, check
    if cnt == 4:
        res = max(res, sum)
        return
    
    for i in range(4):
        nr = r + d[i][0]
        nc = c + d[i][1]
        if 0 <= nr < n and 0 <= nc < m and not check[nr][nc]:
            check[nr][nc] = 1 
            dfs(cnt+1, sum+paper[nr][nc], nr, nc)
            check[nr][nc] = 0

def checkExcluded(r, c):
    global res
    for i in range(4):
        sum = 0
        isComplete = 1
        for j in range(4):
            nr = r + ex_d[i][j][0]
            nc = c + ex_d[i][j][1]

            if 0 <= nr < n and 0 <= nc < m:
                sum += paper[nr][nc]
            else:
                isComplete = 0
                break
        if isComplete:
            res = max(res, sum)

def solution():
    for r in range(n):
        for c in range(m): 
            check[r][c] = 1
            dfs(0,0,r,c)
            check[r][c] = 0

            checkExcluded(r,c)
    print(res)

solution()