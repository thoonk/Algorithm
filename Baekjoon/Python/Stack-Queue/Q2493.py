# 탑 / 스택
import sys 
input = sys.stdin.readline

n = int(input())
towers = list(map(int, input().split()))

def solution():
    stack = [] 
    res = []

    for i in range(n):
        while stack:
            if stack[-1][1] > towers[i]: 
                res.append(stack[-1][0] + 1)
                break
            else:
                stack.pop() 
        
        if not stack:
            res.append(0)
        stack.append([i, towers[i]])
    print(' '.join(map(str, res)))
solution()