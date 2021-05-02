# 최소 스패닝 트리 / 서로소 집합(유니온 파인드)
import sys

def find_parent(x):
    if parent[x] != x:
        parent[x] = find_parent(parent[x])
    return parent[x]

def union_parent(a, b): 
    a = find_parent(a)
    b = find_parent(b)

    if a < b:
        parent[b] = a
    else:
        parent[a] = b

v, e = map(int, sys.stdin.readline().split())
parent = [0] * (v+1)
edges = []
result = 0

for i in range(1, v+1):
    parent[i] = i

for _ in range(e):
    a, b, c = map(int, sys.stdin.readline().split())
    edges.append((a,b,c))

edges.sort(key=lambda x: x[2])

for a, b, c in edges:
    if find_parent(a) != find_parent(b):
        union_parent(a, b)
        result += c

print(result)
