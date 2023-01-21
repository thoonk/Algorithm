# 내 학점을 구해줘 / 수학

for i in range(int(input())):
    subject = int(input())
    credits = 0
    temp = 0
    for _ in range(subject):
        c, g = map(float, input().split())
        credits += c
        temp += c * g
    print(int(credits), '%.01f' % (temp / credits))