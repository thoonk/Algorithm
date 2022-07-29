# 화성 수학 / 수학
for i in range(int(input())):
    expressions = list(map(str, input().split()))
    num = float(expressions[0])

    for j in range(1, len(expressions)):
        if expressions[j] == '@':
            num *= 3
        elif expressions[j] == '%':
            num += 5
        elif expressions[j] == '#':
            num -= 7

    print(format(num, ".2f"))