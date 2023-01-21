# 별 찍기 - 7 / 구현

N = int(input())
for i in range(1, N * 2 + 1):
    if i <= N:
        print(' ' * (N - i) + '*' * (2 * i - 1))
    else:
        print(' ' * (i - N) + '*' * (2 * (N * 2 - i) - 1))