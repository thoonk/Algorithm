# 최댓값 / 구현
board = []
for _ in range(9):
    board.append(list(map(int, input().split())))

max_value = -1
coord = (0, 0)

for i in range(9):
    for j in range(9):
        if max_value < board[i][j]:
            max_value = board[i][j]
            coord = (i + 1, j + 1)

print(max_value)
print(coord[0], coord[1])