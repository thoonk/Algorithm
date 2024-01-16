# 안전지대 / BFS
from collections import deque

def solution(board):
    answer = 0
    dr = [-1, 1, 0, 0, -1, -1, 1, 1]
    dc = [0, 0, -1, 1, -1, 1, -1, 1]
    visited = [[False] * len(board[0]) for _ in range(len(board))]

    def bfs(x, y):
        dq = deque()
        dq.append((x, y))
        while dq:
            r, c = dq.popleft()
            visited[r][c] = True
            for i in range(8):
                nr = r + dr[i]
                nc = c + dc[i]

                if 0 <= nr < len(board) and 0 <= nc < len(board[0]) and not visited[nr][nc]:
                    if board[nr][nc] == 1:
                        dq.append((nr, nc))
                    else:
                        board[nr][nc] = -1

    for i in range(len(board)):
        for j in range(len(board[0])):
            if board[i][j] == 1:
                bfs(i, j)

    for i in range(len(board)):
        answer += board[i].count(0)

    return answer

print(solution([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]]))