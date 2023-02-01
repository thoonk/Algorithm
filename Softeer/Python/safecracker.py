# 금고털이
import sys

input = sys.stdin.readline
answer = 0
W, N = map(int, input().split())
jewels = [list(map(int, input().split())) for _ in range(N)]
jewels.sort(key=lambda x: x[1], reverse=True)

for M, P in jewels:
    if M < W:
        answer += M * P
        W -= M
    else:
        answer += W * P
        break

print(answer)