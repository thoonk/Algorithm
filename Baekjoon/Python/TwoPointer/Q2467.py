# 용액 / 투포인터
import sys
input = sys.stdin.readline

n = int(input())
liquid = list(map(int, input().split()))
start = 0
end = n-1
minVal = sys.maxsize
res_start = 0
res_end = 0

while start < end:
    sum = liquid[start] + liquid[end]

    if abs(sum) < minVal:
        res_start, res_end = start, end
        minVal = abs(sum)
    
    if sum < 0:
        start += 1
    else:
        end -= 1

print(liquid[res_start], liquid[res_end])
