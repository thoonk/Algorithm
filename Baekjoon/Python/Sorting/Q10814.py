import sys

n = int(sys.stdin.readline())
members = []

for _ in range(n):
    members.append(list(sys.stdin.readline().split()))
members.sort(key=lambda x: int(x[0]))

for i in range(n):
    print(members[i][0], members[i][1])

