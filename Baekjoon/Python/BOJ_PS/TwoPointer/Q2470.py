# 용액 / 투포인터

import sys
input = sys.stdin.readline 

n = int(input())
liquids = sorted(list(map(int, input().split())))
start = 0
end = n - 1
pivot = sys.maxsize
index = (0, n - 1)

while start != end: 
    sum = liquids[start] + liquids[end]
    if abs(sum) < pivot:
        pivot = abs(sum)
        index = (start, end)
    
    if sum < 0:
        start += 1
    else: 
        end -= 1

print(liquids[index[0]], liquids[index[1]])
