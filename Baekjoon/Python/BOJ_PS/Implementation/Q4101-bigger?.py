# 크냐? / 구현
while True:
    a, b = map(int, input().split())
    if a == 0 & b == 0:
        break

    print('Yes' if a > b else 'No')
