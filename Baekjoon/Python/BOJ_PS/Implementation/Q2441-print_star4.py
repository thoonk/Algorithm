# 별 찍기-4 / 구현
n = int(input())
for i in range(n):
    print(' ' * i, '*' * (n - i), sep='')