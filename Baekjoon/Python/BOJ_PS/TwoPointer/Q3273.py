# 두 수의 합 / 투포인터
import sys
input = sys.stdin.readline 

n = int(input())
nums = sorted(list(map(int, input().split())))
x = int(input())
count = 0
i = 0
j = n - 1

while i != j:
    sum = nums[i] + nums[j]
    if sum == x:
        count += 1
        i += 1
    elif sum > x:
        j -= 1
    else:
        i += 1

print(count)