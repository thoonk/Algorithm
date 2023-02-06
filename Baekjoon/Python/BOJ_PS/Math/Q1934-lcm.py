# 최소공배수 / 수학
def gcd(a, b):
    return a if b == 0 else gcd(b, a % b)
def lcm(a, b):
    return a * b // gcd(a, b)

for _ in range(int(input())):
    a, b = map(int, input().split())
    print(lcm(a, b))