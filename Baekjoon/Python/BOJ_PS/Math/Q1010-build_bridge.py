# 다리 놓기 / 조합

# from math import comb

def combination(n, k):
    if dp[n][k] != 0:
        return dp[n][k]

    if k == 1:
        return n
    elif n == k or k == 0:
        return 1
    else:
        dp[n][k] = combination(n - 1, k) + combination(n - 1, k - 1)
        return dp[n][k]

for _ in range(int(input())):
    n, m = map(int, input().split())
    # print(comb(m, n))
    dp = [[0 for _ in range(n + 1)] for _ in range(m + 1)]
    print(combination(m, n))
