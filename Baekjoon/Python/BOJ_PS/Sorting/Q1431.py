# 시리얼 번호 / 정렬
import sys
input = sys.stdin.readline
n = int(input())
serials = [input().strip() for _ in range(n)]

def get_sum(s):
    sum = 0
    for c in s:
        if c.isdigit():
            sum += int(c)
    return sum

serials.sort(key= lambda x: (len(x), get_sum(x), x))
for serial in serials:
    print(serial)


