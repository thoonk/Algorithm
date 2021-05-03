# 쉽게 푸는 문제 / 구현, 수학
import sys

a, b = map(int, sys.stdin.readline().split())
nums = []
for i in range(1, 46):
    nums += [i] * i

print(sum(nums[a-1:b]))

