# 링 / 수학
def gcd(a, b):
    return a if b == 0 else gcd(b, a % b)

n = int(input())
rings = list(map(int, input().split()))

for i in range(1, n):
    gcd_value = gcd(rings[0], rings[i])
    print(f'{rings[0] // gcd_value}/{rings[i] // gcd_value}')