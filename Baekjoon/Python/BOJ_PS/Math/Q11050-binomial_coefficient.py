# 이항계수 1 / 수학
# from math import factorial

def factorial(n):
    result = 1
    for i in range(n):
        result *= i + 1
    return result

a, b = map(int, input().split())
print(int(factorial(a) / (factorial(a - b) * factorial(b))))