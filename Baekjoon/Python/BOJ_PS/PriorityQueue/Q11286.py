import sys, heapq 

input = sys.stdin.readline
pq = []

for _ in range(int(input())):
    num = int(input())
    if num == 0:
        print(heapq.heappop(pq)[1] if pq else '0')
    else:
        heapq.heappush(pq, (abs(num), num))
    