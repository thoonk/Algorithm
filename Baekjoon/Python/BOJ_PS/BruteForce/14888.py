# 연산자 끼워넣기 / 백트래킹
import sys
input = sys.stdin.readline

n = int(input())
nums = list(map(int, input().split()))
plus, minus, multi, div = map(int, input().split())
maxVal, minVal = -sys.maxsize-1, sys.maxsize

def solution(cnt, res):
    global maxVal, minVal, plus, minus, multi, div
    if cnt == n:
        maxVal = max(maxVal, res)
        minVal = min(minVal, res)
    
    if plus > 0:
        plus -= 1
        solution(cnt+1, res + nums[cnt])
        plus += 1

    if minus > 0:
        minus -= 1 
        solution(cnt+1, res - nums[cnt])
        minus += 1

    if multi > 0:
        multi -= 1
        solution(cnt+1, res * nums[cnt])
        multi += 1

    if div > 0:
        div -= 1
        solution(cnt+1, int(res / nums[cnt]))
        div += 1

solution(1, nums[0])
print(maxVal, minVal, sep="\n")