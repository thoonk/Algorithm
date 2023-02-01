# 8단 변속기
import sys

input = sys.stdin.readline
gears = list(map(int, input().split()))
is_ascending = 1
is_descending = 1

answer = 'mixed'

for i in range(len(gears) - 1):
    j = i + 1
    if gears[i] < gears[j]:
        if is_descending:
            is_descending = 0
    else:
        if is_ascending:
            is_ascending = 0

if is_ascending:
    answer = 'ascending'
elif is_descending:
    answer = 'descending'
print(answer)


