# 재귀의 귀재 / 재귀
import sys
input = sys.stdin.readline

def recursion(s, l, r):
    global cnt
    cnt += 1
    if l >= r: return 1
    elif s[l] != s[r]: return 0
    else: return recursion(s, l + 1, r - 1)

def is_palindrome(s):
    return recursion(s, 0, len(s) - 1)

for _ in range(int(input())):
    cnt = 0
    print(is_palindrome(input().rstrip()), cnt)

