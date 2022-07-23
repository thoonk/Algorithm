# N번째 큰 수 / 구현, 정렬
import sys

t = int(sys.stdin.readline())

for _ in range(t): 
    nums = list(map(int, sys.stdin.readline().split()))
    nums.sort()
    print(nums[-3])