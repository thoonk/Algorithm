# 파도반 수열 / DP
for _ in range(int(input())):
    n = int(input())
    dp = [0 for _ in range(n + 3)]
    dp[1], dp[2], dp[3] = 1, 1, 1

    for i in range(4, n + 3):
        dp[i] = dp[i - 3] + dp[i - 2]
    print(dp[n])

'''
1 1
1 2
2 3
4
5
7
9
12

dp[1] = 1
dp[2] = 1
dp[3] = 1

dp[4] = 2 = dp[1] + dp[2]
dp[5] = 2 = dp[2] + dp[3]
dp[6] = 3 = dp[3] + dp[4]
dp[7] = dp[4] + dp[5] = 4
'''