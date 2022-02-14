import math

n, m = map(int, input().split())
numerator = math.factorial(n)
denominator = (math.factorial(n - m)) * (math.factorial(m))
print(numerator // denominator)