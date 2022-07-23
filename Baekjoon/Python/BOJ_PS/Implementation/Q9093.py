# 단어 뒤집기 / 문자열
import sys

input = sys.stdin.readline
n = int(input())

for _ in range(n):
    strs = input().split()
    for str in strs:
        print(''.join(reversed(list(str))), end=' ')
    print()
