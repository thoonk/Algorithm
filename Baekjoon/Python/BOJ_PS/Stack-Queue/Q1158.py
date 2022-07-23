# 요세푸스 문제 / 큐
from collections import deque
import sys
input = sys.stdin.readline
n, k = map(int, input().split())
nums = deque([i for i in range(1, n+1)])
res = []

while nums:
    # k-1만큼 왼쪽으로 회전
    nums.rotate(-(k-1))
    res.append(nums.popleft())
print('<' + ', '.join(map(str, res)) + '>')
