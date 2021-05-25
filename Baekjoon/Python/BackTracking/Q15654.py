# N과 M(5) / 백트래킹
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
nums = sorted(list(map(int, input().split())))
arr = []
check = [False for _ in range(n)]

def dfs(cnt):
    if cnt == m:
        print(' '.join(arr))
        return
    
    for i in range(n):
        if not check[i]:
            check[i] = True
            arr.append(str(nums[i]))
            dfs(cnt+1)
            check[i] = False
            arr.pop()
dfs(0)