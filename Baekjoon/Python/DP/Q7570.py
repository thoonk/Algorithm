# 줄 세우기 / DP, 그리디
import sys
input = sys.stdin.readline

n = int(input())
nums = list(map(int, input().split()))
dp = [0 for _ in range(n+1)]

for num in nums:
    dp[num] = dp[num-1] + 1

dp.sort()
print(n-dp[n])