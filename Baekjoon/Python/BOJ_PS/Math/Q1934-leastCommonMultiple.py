def get_gcd(a, b):
    return a if b == 0 else get_gcd(b, a % b)

def get_lcm(a, b):
    return a * b / get_gcd(a, b)

for _ in range(int(input())):
    a, b = map(int, input().split())
    print(int(get_lcm(a, b)))

