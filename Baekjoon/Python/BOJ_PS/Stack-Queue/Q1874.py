# 스택 수열 / 스택
import sys
input = sys.stdin.readline

def solution():
    stack = [] 
    res = []
    cnt = 1
    isPossible = True

    for _ in range(int(input())): 
        n = int(input())
        while cnt <= n:
            stack.append(cnt)
            res.append('+')
            cnt += 1
        
        if stack[-1] == n:
            stack.pop()
            res.append('-')
        else:
            isPossible = False
            break

    if isPossible == False:
        print("NO")
    else: 
        for i in res:
            print(i)

solution()