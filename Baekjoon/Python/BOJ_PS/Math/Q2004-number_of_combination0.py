# 조합 0의 개수 / 수학

def count_zero(n, k):
    count = 0
    while n:
        n //= k
        count += n
    return count

n, m = map(int, input().split())
count_5 = count_zero(n, 5) - count_zero(m, 5) - count_zero(n - m, 5)
count_2 = count_zero(n, 2) - count_zero(m, 2) - count_zero(n - m, 2)
print(min(count_5, count_2))