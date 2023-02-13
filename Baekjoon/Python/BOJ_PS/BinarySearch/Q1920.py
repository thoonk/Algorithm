# 수 찾기 / 이진탐색
def binary_search(a, num):
    start, end = 0, len(a) - 1
    if num < a[start]:
        return 0
    elif num > a[end]:
        return 0
    else:
        while start <= end: 
            mid = (start + end) // 2
            
            if a[mid] == num:
                return 1
            elif a[mid] < num:
                start = mid + 1
            else:
                end = mid - 1
        return 0

n = int(input())
a = list(map(int, input().split()))
m = int(input())
checks = list(map(int, input().split()))

a.sort()
for check in checks:
    print(binary_search(a, check))