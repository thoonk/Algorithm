# 카드 합체 놀이 / 그리디, 우선순위 큐
import heapq
import sys
input = sys.stdin.readline

n, m = map(int, input().split())
nums = list(map(int, input().split()))
pq = []

for num in nums: 
    heapq.heappush(pq, num)

for _ in range(m):
    first = heapq.heappop(pq)
    second = heapq.heappop(pq)
    temp = first + second
    heapq.heappush(pq, temp)
    heapq.heappush(pq, temp)

print(sum(pq))