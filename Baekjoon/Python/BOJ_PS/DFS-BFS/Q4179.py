# 불! / BFS
import sys
input = sys.stdin.readline

n, m = map(int, input().split())
maze = [list(map(str, input().strip())) for _ in range(n)]
d = [(0,-1), (0,1), (-1,0), (1,0)]
jq = []
fq = []

def spreadFire():
    for _ in range(len(fq)):
        r, c = fq.pop(0)
        
        for i in range(4):
            nr = r + d[i][0]
            nc = c + d[i][1]
            
            if 0 <= nr < n and 0 <= nc < m: 
                if maze[nr][nc] == ".":
                    maze[nr][nc] = "F"
                    fq.append((nr,nc))
                
def moveJ():
    for _ in range(len(jq)):
        r, c = jq.pop(0)
        
        for i in range(4):
            nr = r + d[i][0]
            nc = c + d[i][1]
            
            if 0 <= nr < n and 0 <= nc < m: 
                if maze[nr][nc] == ".":
                    maze[nr][nc] = "J"
                    jq.append((nr,nc)) 
            else:
                return True
    return False

def solution():
    for i in range(n):
        for j in range(m):
            if maze[i][j] == 'J':
                jq.append((i,j))
            elif maze[i][j] == 'F':
                fq.append((i,j))

    res = 0
    while True:
        res += 1
        if len(jq) == 0:
            print('IMPOSSIBLE')
            break
        spreadFire()
        if moveJ() == True:
            print(res)
            break
solution()