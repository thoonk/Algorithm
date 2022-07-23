# 안정적인 문자열 / 스택, 문자열, 그리디
import sys
input = sys.stdin.readline
index = 0
while True:
    data = input().rstrip()
    if data[0] == '-':
        break
    
    stack = []
    cnt = 0

    for d in data: 
        if d == '{':
            stack.append('{') 
        else:
            if stack:
                stack.pop()
            else:
                stack.append('{')
                cnt += 1
    index += 1
    print(str(index) + ". " + str(cnt + int(len(stack)/2)))
    