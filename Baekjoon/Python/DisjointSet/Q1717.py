# 집합의 표현 / 서로소 집합(유니온 파인드)
import sys

def find(x):
    if parent[x] != x:
        parent[x] = find(parent[x])
    return parent[x]

def union(a, b):
    a = find(a)
    b = find(b) 

    if a < b:
        parent[b] = a
    else:
        parent[a] = b

sys.setrecursionlimit(100000)
input = sys.stdin.readline
n, m = map(int, input().split())
parent = [i for i in range(n+1)]

for _ in range(m):
    cmd, a, b = map(int, input().split())
    if cmd == 0:
        union(a, b)
    elif cmd == 1:
        if find(a) == find(b):
            print('YES')
        else:
            print('NO')

