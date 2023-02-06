# 최대 공약수와 최소 공배수 / 수학
def gcd(a, b):
    return a if b == 0 else gcd(b, a % b)
def lcm(a, b):
    return a * b // gcd(a, b)

a, b = map(int, input().split())
print(gcd(a, b))
print(lcm(a, b))
