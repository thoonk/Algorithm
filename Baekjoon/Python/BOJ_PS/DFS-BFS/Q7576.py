# 토마토 / BFS
# import sys
# from collections import deque
# input = sys.stdin.readline
# m, n = map(int, input().split())
# box = [list(map(int, input().split())) for _ in range(n)]
# ripen = 0
# zero = 0
# q = deque([])
# res = 0

# def bfs():
#     global ripen, res
#     d = [(-1,0),(1,0),(0,-1),(0,1)]
#     while q:
#         r, c = q.popleft()

#         for i in range(4):
#             nr = r + d[i][0]
#             nc = c + d[i][1]

#             if 0 <= nr < n and 0 <= nc < m and box[nr][nc] == 0:
#                 q.append((nr,nc))
#                 box[nr][nc] = box[r][c] + 1
#                 ripen += 1 
#                 res = max(res, box[nr][nc])

# def solution():
#     global zero
#     for r in range(n):
#         for c in range(m):
#             if box[r][c] == 1 :
#                 q.append((r,c))
#             elif box[r][c] == 0:
#                 zero += 1

#     bfs()
#     if zero == 0:
#         print(0)
#     else:
#         print(res-1 if zero == ripen else -1)

# solution()

import sys
from collections import deque
input = sys.stdin.readline

def bfs():
    global ripen
    d = [[-1, 0], [1, 0], [0, -1], [0, 1]]   
    
    while q: 
        r, c = q.popleft()

        for i in range(4):
            nr = r + d[i][0]
            nc = c + d[i][1]
            
            if 0 <= nr < n and 0 <= nc < m: 
                if box[nr][nc] == 0:
                    box[nr][nc] = box[r][c] + 1
                    ripen += 1
                    q.append((nr, nc))
        

m, n = map(int, input().split())
box = []
ripen = 0
zero = 0
q = deque()

for _ in range(n): 
    box.append(list(map(int, input().split())))

for i in range(n): 
    for j in range(m):
        if box[i][j] == 0:
            zero += 1
        elif box[i][j] == 1: 
            q.append((i, j))

bfs()

print(max(map(max, box)) - 1 if zero == ripen else '-1')