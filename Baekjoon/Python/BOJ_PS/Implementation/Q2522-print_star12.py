# 별 찍기 - 12 / 구현

N = int(input())
for i in range(1, N * 2 + 1):
    if i <= N:
        print(' ' * (N - i) + '*' * i)
    else:
        print(' ' * (i - N) + '*' * (N * 2 - i))