# 행렬 / 그리디
import sys
input = sys.stdin.readline
n, m = map(int, input().split())
a, b = [], []
res = 0
# 입력 받기
for _ in range(n):
    a.append(list(map(int, input().rstrip())))
for _ in range(n):
    b.append(list(map(int, input().rstrip())))

def convert(r, c):
    for i in range(r, r+3):
        for j in range(c, c+3):
            a[i][j] = 1 - a[i][j]

def isEqual():
    for i in range(n):
        for j in range(m):
            if a[i][j] != b[i][j]:
                return False
    return True
    
for i in range(n-2):
    for j in range(m-2):
        if a[i][j] != b[i][j]:
            res += 1
            convert(i, j)
    
print(res if isEqual() == True else -1)