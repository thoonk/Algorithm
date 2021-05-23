# n과 m (2) / 백트래킹
import sys
input = sys.stdin.readline 

n, m = map(int, input().split())

arr = [0 for i in range(m)]
check = [0 for i in range(n+1)]

def dfs(cnt):
    if cnt == m:
        for i in range(m):
            print(arr[i], end=' ')
        print()
        return 

    for i in range(1, n+1):
        if check[i] == 1:
            continue
        
        for j in range(i+1):
            check[j] = 1 
        arr[cnt] = i
        dfs(cnt+1)
        for j in range(1, n+1):
            check[j] = 0
dfs(0)