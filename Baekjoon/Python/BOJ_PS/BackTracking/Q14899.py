# 스타트와 링크 / 백트래킹
import sys
input = sys.stdin.readline
n = int(input())
startLink = [list(map(int, input().split())) for _ in range(n)]
check = [0] * n
res = sys.maxsize

def dfs(cnt, current):
    global res
    if cnt == n // 2:
        start = []
        link = []

        for i in range(n):
            if check[i]:
                start.append(i)
            else:
                link.append(i) 

        start_abil = 0
        link_abil = 0
        for i in range(len(start)):
            for j in range(i+1, len(start)):
                start_abil += startLink[start[i]][start[j]] + startLink[start[j]][start[i]]
                link_abil += startLink[link[i]][link[j]] + startLink[link[j]][link[i]]
        res = min(res, abs(start_abil - link_abil))
        return
    
    for i in range(current+1, n):
        if not check[i]:
            check[i] = 1
            dfs(cnt+1, i)
            check[i] = 0
dfs(0,0)
print(res)
