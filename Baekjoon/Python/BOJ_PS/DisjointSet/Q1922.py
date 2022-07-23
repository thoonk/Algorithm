# 네트워크 연결 / 최소 스패닝 트리
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

input = sys.stdin.readline
n = int(input())
m = int(input())
parent = [i for i in range(n+1)]
edges = []

for _ in range(m):
    a, b, c = map(int, input().split())
    edges.append((a,b,c))

edges.sort(key=lambda x: x[2])

result = 0
for edge in edges:
    a, b, c = edge
    if find(a) != find(b):
        union(a, b)
        result += c
print(result)