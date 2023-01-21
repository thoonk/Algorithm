# 사과 / 수학

N = int(input())
remain = []
for _ in range(N):
    students, apples = map(int, input().split())
    while apples // students > 0:
        apples %= students
    remain.append(apples)

print(sum(remain))