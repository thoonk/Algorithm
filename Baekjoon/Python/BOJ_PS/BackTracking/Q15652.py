#  N과 M (4) / 백트래킹
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
arr = []
prev = 0
def dfs(cnt):
    global prev
    if cnt == m:
        print(' '.join(arr))
        return
    
    for i in range(1, n+1):
        if prev <= i:
            prev = i
            arr.append(str(i))
            dfs(cnt+1)
            prev = 0
            arr.pop()
dfs(0)            
