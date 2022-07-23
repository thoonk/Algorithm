# 로프 / 그리디, 정렬, 수학
import sys
n = int(input())
ropes = []
res = 0

for _ in range(n):
    ropes.append(int(input()))
ropes.sort()

for i in range(n):
    res = max(res, ropes[i] * (n-i))
print(res)