# 나이트의 이동 / 그래프(BFS)
import sys
from collections import deque
input = sys.stdin.readline

d = [
    [2, -1], [-2, 1], [-2, -1], [2, 1],
    [1, -2], [-1, 2], [-1, -2], [1, 2]
]

def bfs(sr, sc, tr, tc): 
    q = deque([(sr, sc)])
    
    while q:
        r, c = q.popleft()
        
        if r == tr and c == tc:
            print(graph[r][c])
            return
        
        for i in range(8):
            nr = r + d[i][0]
            nc = c + d[i][1]
            
            if 0 <= nr < n and 0 <= nc < n:
                if graph[nr][nc] == 0:
                    graph[nr][nc] = graph[r][c] + 1
                    q.append((nr, nc))

for _ in range(int(input())):
    n = int(input())
    graph = [[0 for _ in range(n)] for _ in range(n)]
    sr, sc = map(int, input().rstrip().split())
    tr, tc = map(int, input().rstrip().split())

    bfs(sr, sc, tr, tc)