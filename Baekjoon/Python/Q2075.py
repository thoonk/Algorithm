# N번째 큰 수
import sys, heapq

input = sys.stdin.readline
n = int(input())

nums = []
for _ in range(n):
    nums.append(list(map(int, input().split())))

pq = []
for i in range(n):
    for j in range(n): 
        heapq.heappush(pq, nums[i][j])
        if len(pq) > n:
            heapq.heappop(pq)
print(pq[0])
