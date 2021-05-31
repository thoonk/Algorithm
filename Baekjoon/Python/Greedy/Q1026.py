# 보물 / 그리드
n = int(input())
a = list(map(int, input().split()))
b = list(map(int, input().split()))
res = 0
print(a,b)
while n > 0:
    min_a = min(a)
    max_b = max(b)
    res += min_a * max_b
    a.remove(min_a)
    b.remove(max_b)
    n -= 1
print(res)