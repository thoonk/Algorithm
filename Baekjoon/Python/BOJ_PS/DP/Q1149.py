# RGB 거리 / DP
n = int(input())
houses = [list(map(int, input().split())) for _ in range(n)]

for i in range(1, n):
    houses[i][0] = min(houses[i - 1][1], houses[i - 1][2]) + houses[i][0]
    houses[i][1] = min(houses[i - 1][0], houses[i - 1][2]) + houses[i][1]
    houses[i][2] = min(houses[i - 1][0], houses[i - 1][1]) + houses[i][2]

print(min(houses[n - 1]))

'''
0 1 2
빨 초 파 

[i][0] = min([i-1][1], [i-1][2]) + [i][0]
'''