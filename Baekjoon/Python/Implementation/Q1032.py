# 명령 프롬프트 / 문자열, 구현
import sys

input = sys.stdin.readline
n = int(input())
files = [list(input().strip()) for i in range(n)]
comparer = list(files[0])

for files in files:
    for j in range(len(comparer)):
        if comparer[j] != files[j]:
            comparer[j] = '?'
print(''.join(comparer))