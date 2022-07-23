# 옥상 정원 꾸미기 / 스택
import sys
input = sys.stdin.readline
res = 0
stack = []
for _ in range(int(input())):
    height = int(input())
    while len(stack) > 0 and height >= stack[-1]:
        stack.pop()
    res += len(stack)
    stack.append(height)
print(res)