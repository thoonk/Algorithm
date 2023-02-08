# 팩토리얼 0의 개수 / 수학

n = int(input())
answer = 0

while n >= 5:
    answer += n // 5
    n //= 5

print(answer)