# 색종이 / 구현
n = int(input())
board = [[0 for _ in range(101)] for _ in range(101)]
for _ in range(n):
    x, y = map(int, input().split())
    for i in range(x, x + 10):
        for j in range(y, y + 10):
            board[i][j] = 1

answer = 0
for row in board:
    answer += row.count(1)
print(answer)