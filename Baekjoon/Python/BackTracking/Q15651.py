# N과 M (3) / 백트래킹
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
arr = []

def dfs(cnt): 
    if cnt == m:
        print(' '.join(arr))
        return
    
    for i in range(1, n+1):
        arr.append(str(i))
        dfs(cnt+1)
        arr.pop()
dfs(0)