# 별 찍기 - 6 / 구현

N = int(input())
for i in range(N, 0, -1):
    print(' ' * (N - i) + '*' * (2 * i - 1))