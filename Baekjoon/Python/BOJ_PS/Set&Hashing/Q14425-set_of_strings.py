# 문자열 집합 / 집합
n, m = map(int, input().split())
s = set([input() for _ in range(n)])
answer = 0

for _ in range(m):
    if input() in s:
        answer += 1
print(answer)