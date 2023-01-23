# 팩토리얼 / 재귀

# from math import factorial
def factorial(n):
    if n <= 1:
        return 1
    else:
        return n * factorial(n - 1)

N = int(input())
print(factorial(N))
