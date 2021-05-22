# 감소하는 수 / 백트래킹
import sys
input = sys.stdin.readline
sys.setrecursionlimit(100000)
n = int(input())
nums = []

def findDesc(idx, digit, num):
    global nums

    for i in range(idx, 10):
        num += i * digit
        nums.append(num)
        findDesc(idx+1, digit*10, num)
        num -= i * digit

def solution():
    global nums
    if n > 1022:
        print(-1)
        return
    else:
        findDesc(0,1,0)
        if len(nums) <= n:
            print(-1)
            return
        nums.sort()
        print(nums)
solution()

        