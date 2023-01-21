# 별 찍기 - 8 / 구현

N = int(input())
for i in range(1, N * 2 + 1):
    if i <= N:
        print('*' * i + ' ' * (2 * (N - i)) + '*' * i)
    else:
        star = (N * 2 - i)
        print('*' * star + ' ' * (2 * (i - N)) + '*' * star)
