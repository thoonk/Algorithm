# 소수 찾기 / 수학
def set_prime(n):
    prime_list = [True for _ in range(n+1)]
    prime_list[0] = False
    prime_list[1] = False

    for i in range(1, n + 1):
        if prime_list[i]:
            for j in range(i*i, n+1, i):
                prime_list[j] = False
    return prime_list

n = int(input())
nums = list(map(int, input().split()))
count = 0

prime_list = set_prime(max(nums))
for num in nums:
    if prime_list[num]:
        count += 1
print(count)
