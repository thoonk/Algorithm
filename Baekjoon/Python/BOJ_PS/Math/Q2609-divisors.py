# 약수 / 수학
n = int(input())
divisors = list(map(int, input().split()))
divisors.sort()

if n == 1:
    print(divisors[0] ** 2)
else:
    print(divisors[0] * divisors[-1])
