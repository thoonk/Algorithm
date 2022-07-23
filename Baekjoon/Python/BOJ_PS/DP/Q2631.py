# 줄 세우기 / DP, 그리드
import sys
input = sys.stdin.readline

n = int(input())
nums = [int(input()) for _ in range(n)]
dp = [1] * n

for i in range(1, n):
    for j in range(i):
        if nums[i] > nums[j]:
            dp[i] = max(dp[i], dp[j] + 1)
dp.sort()
print(n - dp[n-1])
