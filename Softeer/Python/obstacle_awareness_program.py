# 장애물 인식 프로그램
import sys

def dfs(x, y):
    if 0 > x or x >= N or 0 > y or y >= N:
        return 0
    if graph[x][y] == 1:
        graph[x][y] = 0
        cnt = 1
        cnt += dfs(x - 1, y)
        cnt += dfs(x + 1, y)
        cnt += dfs(x, y - 1)
        cnt += dfs(x, y + 1)
        return cnt
    return 0


input = sys.stdin.readline

N = int(input())
graph = []
answer = []

for _ in range(N):
    graph.append(list(map(int, input().rstrip())))

for i in range(N):
    for j in range(N):
        cnt = dfs(i, j)
        if cnt:
            answer.append(cnt)

answer.sort()
print(len(answer))
for cnt in answer:
    print(cnt)