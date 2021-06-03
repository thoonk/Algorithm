# 숨바꼭질 / BFS
import sys
input = sys.stdin.readline
n, k = map(int, input().split())
size = 100001
check = [0] * size

def bfs(): 
    q = []
    q.append(n)
    check[n] = 1

    while q:
        x = q.pop(0)

        if x == k:
            print(check[x]-1)
            return

        if 0 <= x-1 and check[x-1] == 0 :
            q.append(x-1)
            check[x-1] = check[x] + 1
                
        if x+1 < size and check[x+1] == 0:
            q.append(x+1)
            check[x+1] = check[x] + 1
        
        if x*2 < size and check[x*2] == 0:
            q.append(x*2)
            check[x*2] = check[x] + 1
bfs()