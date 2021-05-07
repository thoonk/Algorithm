# 포도주 시식 / DP
import sys

input = sys.stdin.readline
n = int(input())
wine = [int(input()) for i in range(n)]
dp = [0] * n

def solution():
    if n == 1:
        return wine[0]
    elif n == 2:
        return wine[0] + wine[1]
    else: 
        dp[0] = wine[0]
        dp[1] = max(wine[1], wine[0] + wine[1])
        dp[2] = max(dp[1], wine[0] + wine[2], wine[1] + wine[2])
        for i in range(3, n):
            dp[i] = max(dp[i-2] + wine[i], dp[i-3] + wine[i-1] + wine[i]) 
            dp[i] = max(dp[i-1], dp[i])
        return dp[n-1]
print(solution())

