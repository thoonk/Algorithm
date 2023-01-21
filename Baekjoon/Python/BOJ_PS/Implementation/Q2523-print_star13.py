# 별 찍기 - 13 / 구현

N = int(input())
for i in range(1, N * 2 + 1):
    if i <= N:
        print('*' * i)
    else:
        print('*' * (N * 2 - i))