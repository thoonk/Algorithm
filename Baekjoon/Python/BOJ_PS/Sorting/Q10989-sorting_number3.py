import sys
input = sys.stdin.readline
N = int(input())
counter = [0 for _ in range(10001)]

for _ in range(N):
    counter[int(input())] += 1
for i in range(10001):
    while counter[i] != 0:
        counter[i] -= 1
        print(i)
