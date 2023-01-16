# 소수 / 수학
def set_prime(n):
    prime_list = [True for _ in range(n + 1)]
    prime_list[0] = False
    prime_list[1] = False

    for i in range(1, n+1):
        if prime_list[i]:
            for j in range(i * i, n + 1, i):
                prime_list[j] = False

    return prime_list

m = int(input())
n = int(input())
result = []

prime_list = set_prime(n)
for i in range(n+1):
    if prime_list[i]:
        if m <= i <= n:
            result.append(i)

if result:
    print(sum(result), min(result), sep='\n')
else:
    print(-1)

