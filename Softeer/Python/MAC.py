# 지도 자동 구축 / DP
import sys

input = sys.stdin.readline

N = int(input())
dp = [0 for _ in range(16)]
dp[0] = 2

for i in range(1, N + 1):
    dp[i] = dp[i - 1] + dp[i - 1] - 1
print(dp[N] ** 2)