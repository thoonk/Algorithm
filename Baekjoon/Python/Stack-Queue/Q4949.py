# 균형잡힌 세상 / 스택
import sys
input = sys.stdin.readline

while True:
    s = input().rstrip()
    if s == '.':
        break
    stack = []
    isPair = True
    for char in s:
        if char == '(' or char == '[':
            stack.append(char)
        elif char == ')':
            if stack and stack[-1] == '(':
                stack.pop()
            else:
                isPair = False
                break 
        elif char == ']':
            if stack and stack[-1] == '[':
                stack.pop()
            else:
                isPair = False
                break
    print('yes' if not stack and isPair else 'no')
