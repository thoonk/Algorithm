# 뱀과 사다리 게임 / 그래프(BFS)

import sys
from collections import deque
input = sys.stdin.readline 

def bfs():
    q = deque([1])
    visited[1] = 1
    
    while q:
        now = q.popleft()
        if now == 100: 
            print(board[now])
            return
        
        for dice in range(1, 7):
            next = now + dice
            
            if next <= 100 and not visited[next]:
                if next in ladders.keys():
                    next = ladders[next]
                if next in snakes.keys():
                    next = snakes[next]
                if not visited[next]:
                    q.append(next)
                    board[next] = board[now] + 1
                    visited[next] = 1
 
n, m = map(int, input().split())
board = [0 for _ in range(101)]
visited = [0 for _ in range(101)]
ladders = {}
snakes = {}
for _ in range(n):
    x, y = map(int, input().split())
    ladders[x] = y

for _ in range(m):
    u, v = map(int, input().split())
    snakes[u] = v

bfs()