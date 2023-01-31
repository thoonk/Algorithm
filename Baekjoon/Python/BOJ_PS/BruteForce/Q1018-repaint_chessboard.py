# 체스판 다시 칠하기 / 브루트포스
N, M = map(int, input().split())
board = []
count = []
for _ in range(N):
    board.append(list(input()))

for i in range(N - 7):
    for j in range(M - 7):
        w_count = 0
        b_count = 0
        for k in range(i, i + 8):
            for l in range(j, j + 8):
                if (k + l) % 2 == 0:
                    if board[k][l] != 'W':
                        w_count += 1
                    else:
                        b_count += 1
                else:
                    if board[k][l] != 'W':
                        b_count += 1
                    else:
                        w_count += 1
        count.append(w_count)
        count.append(b_count)

print(min(count))
