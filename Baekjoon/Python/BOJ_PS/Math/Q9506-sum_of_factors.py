# 약수들의 합

while True:
    n = int(input())

    if n == -1:
        break

    factors = [1]

    for i in range(2, n):
        if n % i == 0:
            factors.append(i)

    result = f'{n} = 1'
    if n == sum(factors):
        for j in range(1, len(factors)):
            result += f' + {factors[j]}'
        print(result)
    else:
        print(f'{n} is NOT perfect.')