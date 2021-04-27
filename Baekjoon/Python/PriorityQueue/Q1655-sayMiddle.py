import heapq
import sys

n = int(sys.stdin.readline())
left, right = [], []

for _ in range(n):
    num = int(sys.stdin.readline())

    if len(left) == len(right):
        heapq.heappush(left, (-num, num))
    else:
        heapq.heappush(right, (num, num))

    if left and right and left[0][1] > right[0][1]:
        leftValue = heapq.heappop(left)[1]
        rightValue = heapq.heappop(right)[1]

        heapq.heappush(left, (-rightValue, rightValue))
        heapq.heappush(right, (leftValue, leftValue))

    print(left[0][1])