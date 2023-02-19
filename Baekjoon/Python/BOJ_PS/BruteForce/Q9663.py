# N-Queen / 백트래킹 
# Python3 통과 못 함.

import sys
input = sys.stdin.readline 

def attackable(x): 
    for i in range(x):
        if columns[x] == columns[i] or abs(columns[i] - columns[x]) == x - i:
            return True
    return False

def dfs(x):
    global answer
    if len(visited) == n:
        answer += 1
        return 
    
    for y in range(n): 
        check = True
        for r, c in visited:
            if y == c:
                check = False
                break
            if abs(x - r) == abs(y - c):
                check = False
                break
        if check:
            visited.append((x, y))
            dfs(x + 1)
            visited.pop()
        
        # columns[x] = i
        # if attackable(x) == False:
        #     visited[i] = 1
        #     dfs(x + 1)
        #     visited[i] = 0

n = int(input())
columns = [0 for _ in range(n)]
visited = []
answer = 0

dfs(0)
print(answer)