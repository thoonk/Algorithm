# 최대 힙 / 우선순위큐

import sys
import heapq

input = sys.stdin.readline
pq = []

n = int(input())
for _ in range(n):
    num = int(input())

    if num == 0:
        if pq:
            print(-heapq.heappop(pq))
        else:
            print('0')
    else:
        heapq.heappush(pq, -num)
