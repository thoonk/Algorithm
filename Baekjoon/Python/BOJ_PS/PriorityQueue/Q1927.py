import sys
import heapq

input = sys.stdin.readline
pq = []

for _ in range(int(input())): 
    num = int(input())
    if num == 0:
        print(heapq.heappop(pq) if pq else '0')
    else:
        heapq.heappush(pq, num)

