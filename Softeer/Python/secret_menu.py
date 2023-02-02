# 비밀 메뉴
import sys

input = sys.stdin.readline
M, N, K = map(int, input().split())
secret = list(map(int, input().split()))
nums = list(map(int, input().split()))
answer = 'normal'

for i in range(N - 2):
    if nums[i:i + M] == secret:
        answer = 'secret'
        break
print(answer)