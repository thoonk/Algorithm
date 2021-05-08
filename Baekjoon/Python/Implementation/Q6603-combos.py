# 로또 / 백트래킹, 순열
import sys
from itertools import combinations
input = sys.stdin.readline

while True:
    nums = input().split()
    if nums.pop(0) == '0':
        break
    for num in combinations(nums, 6):
        print(' '.join(num))
    print()