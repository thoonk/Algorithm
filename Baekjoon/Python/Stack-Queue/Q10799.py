# 쇠막대기 / 스택
import sys
input = sys.stdin.readline

paren = input().strip()
stack = [] 
res = 0
for (i, p) in enumerate(paren): 
    if p == '(':
        stack.append(p)
    else:
        if paren[i-1] == '(':
            stack.pop()
            res += len(stack)
        else:
            stack.pop()
            res += 1
print(res)