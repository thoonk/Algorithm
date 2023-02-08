# 이항 계수 2 / 수학
# from math import comb

n, k = map(int, input().split())
dp = [[1] * (i + 1) for i in range(n + 1)]

for i in range(2, n + 1):
    for j in range(1, i):
        dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j]) % 10007

print(dp[n][k])
# print(comb(n, k) % 10007)