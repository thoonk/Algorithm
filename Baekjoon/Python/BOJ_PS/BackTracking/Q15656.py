# N과 M (7) / 백트래킹
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
nums = sorted(list(map(int, input().split())))
arr = []

def dfs(cnt):
    if cnt == m:
        print(' '.join(arr))
        return
    
    for i in range(n):
        arr.append(str(nums[i]))
        dfs(cnt+1)
        arr.pop()
dfs(0)