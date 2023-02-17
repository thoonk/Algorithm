# 최단 경로 / 다익스트라
import sys
import heapq
input = sys.stdin.readline
INF = int(1e9)

n, e = map(int, input().split())
graph = [[] for _ in range(n)]
distance = [INF] * n
k = int(input()) - 1

for _ in range(e):
    u, v, w = map(int, input().split())
    graph[u - 1].append((w, v - 1))

def djkstra(k):
    pq = []
    heapq.heappush(pq, (0, k))
    distance[k] = 0
    
    while pq:
        cost, node = heapq.heappop(pq)
        
        if distance[node] < cost:
            continue
        
        for next_cost, next_node in graph[node]:
            new_cost = cost + next_cost
            if new_cost < distance[next_node]:
                distance[next_node] = new_cost
                heapq.heappush(pq, (new_cost, next_node))

djkstra(k)

for i in range(n):
    print('INF' if distance[i] == INF else distance[i])
    