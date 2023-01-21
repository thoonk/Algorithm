# 별 찍기 - 5 / 구현

N = int(input())
for i in range(1, N + 1):
    print(' ' * (N - i) + '*' * (2 * i - 1))