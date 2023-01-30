# 덩치 / 브루트포스
N = int(input())
people = []
for i in range(N):
    people.append(list(map(int, input().split())))

for i in range(N):
    order = 1
    for j in range(N):
        if people[i][0] < people[j][0] and people[i][1] < people[j][1]:
            order += 1

    print(order, end=' ')
