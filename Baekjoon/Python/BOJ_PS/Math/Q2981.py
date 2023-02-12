# 검문 / 수학 (유클리드 호제)

import sys
import math

input = sys.stdin.readline
n = int(input())
nums = [int(input().rstrip()) for _ in range(n)]
nums.sort()
answer = []

common_divisors = [nums[i] - nums[i - 1] for i in range(1, n)]
gcd = common_divisors[0]

for i in range(1, n - 1):
    gcd = math.gcd(gcd, common_divisors[i])

answer.append(gcd)
temp = int(gcd ** 0.5)
for i in range(2, temp + 1):
    if gcd % i == 0:
        answer.append(i)
        answer.append(gcd // i)

answer = list(set(answer))
answer.sort()
for a in answer:
    print(a, end=' ')
