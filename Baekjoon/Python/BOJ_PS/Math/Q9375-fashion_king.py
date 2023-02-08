# 패션왕 신해빈 / 조합

for _ in range(int(input())):
    n = int(input())
    dict = {}
    for _ in range(n):
        name, category = input().split()
        if dict.get(category) == None:
            dict[category] = 1
        else:
            dict[category] += 1

    answer = 1
    for category in dict.keys():
        answer *= dict[category] + 1
    print(answer - 1)