# 상자 넣기 / 다이나믹 프로그래밍

n = int(input())
box = list(map(int, input().split()))
dp = [0] * n

for i in range(1, n):
    temp = []
    for j in range(i):
        if box[j] < box[i]:
            temp.append(dp[j] + 1)

    if temp:
        dp[i] = max(temp)

print(max(dp) + 1)