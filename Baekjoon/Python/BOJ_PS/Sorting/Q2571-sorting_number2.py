# 수 정렬하기 2 / 정렬

import sys
input = sys.stdin.readline
N = int(input())
nums = []
for _ in range(N):
    nums.append(int(input()))

nums.sort()
for i in range(N):
    print(nums[i], sep='\n')
