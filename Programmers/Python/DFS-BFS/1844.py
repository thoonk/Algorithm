# 게임 맵 최단거리 / BFS
from collections import deque

def solution(maps):
    answer = 0
    q = deque()
    q.append((0, 0))
    d = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    
    while q:
        r, c = q.popleft()
        
        for i in range(4):
            nr = r + d[i][0]
            nc = c + d[i][1]
            
            if 0 <= nr < len(maps) and 0 <= nc < len(maps[0]) and maps[nr][nc] == 1:
                maps[nr][nc] = maps[r][c] + 1
                q.append((nr, nc))
        
    answer = maps[len(maps) - 1][len(maps[0]) - 1]
        
    return -1 if answer == 1 else answer 
