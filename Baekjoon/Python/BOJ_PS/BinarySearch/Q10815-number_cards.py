# 숫자 카드 / 맵, 이진탐색

# from collections import Counter
#
# N = int(input())
# own_nums = list(map(int, input().split()))
# M = int(input())
# cmp_nums = list(map(int, input().split()))
# counter = Counter(own_nums)
#
# for num in cmp_nums:
#     print(1 if counter[num] == 1 else 0, end=' ')

N = int(input())
own_nums = sorted(list(map(int, input().split())))
M = int(input())
cmp_nums = list(map(int, input().split()))

for num in cmp_nums:
    check = 0
    start, end = 0, N - 1
    while start <= end:
        mid = (start + end) // 2
        if own_nums[mid] > num:
            end = mid - 1
        elif own_nums[mid] < num:
            start = mid + 1
        else:
            check = 1
            break
    print(check, end=' ')