# N과 M (8) / 백트래킹
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
nums = sorted(list(map(int, input().split())))
arr = []
check = [0 for _ in range(n)]

def dfs(cnt):
    if cnt == m:
        print(' '.join(arr))
        return
    
    for i in range(n):
        if check[i] == 1:
            continue
        
        for j in range(i):
            check[j] = 1
        arr.append(str(nums[i]))
        dfs(cnt+1)
        arr.pop() 
        for j in range(n):
            check[j] = 0
dfs(0)