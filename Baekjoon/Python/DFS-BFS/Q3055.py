# 탈출 / BFS
import sys

def fillUp():
    for i in range(len(water)):
        now_r, now_c = water.pop(0)
        for i in range(4):
            dr, dc = d[i]
            nr = now_r + dr
            nc = now_c + dc

            if 0 <= nr < r and 0 <= nc < c and forest[nr][nc] == '.':
                forest[nr][nc] = '*'
                water.append((nr, nc))
                

def goToBeaver():
    for i in range(len(hedgehog)):
        now_r, now_c = hedgehog.pop(0)
        time[now_r][now_c] = 1
        for i in range(4):
            dr, dc = d[i]
            nr = now_r + dr
            nc = now_c + dc

            if 0 <= nr < r and 0 <= nc < c:
                if forest[nr][nc] == "D": 
                    return True
                if forest[nr][nc] == '.':
                    forest[nr][nc] = 'S'
                    hedgehog.append((nr, nc))
                    time[nr][nc] = time[now_r][now_c] + 1

    return False


input = sys.stdin.readline
r, c = map(int, input().split())
forest = [list(map(str, input().strip())) for _ in range(r)]
d = [(0,-1), (0,1), (-1,0), (1,0)]
water = []
hedgehog = []
time = [[0]*c for _ in range(r)]

for i in range(r):
    for j in range(c):
        if forest[i][j] == 'S':
            hedgehog.append((i,j))
        elif forest[i][j] == '*':
            water.append((i,j))

result = 0
while True:
    result += 1
    if len(hedgehog) == 0:
        print('KAKTUS')
        break
    fillUp()
    if goToBeaver() == True:
        print(result)
        break