# 곱셈 / 재귀
import sys 
input = sys.stdin.readline

a, b, c = map(int, input().split())

def oprt(a, b, c):
    if b == 1:
        return a 
    else:
        temp = oprt(a, b//2, c)
        if b % 2 == 0:
            return temp * temp % c
        else:
            return temp * temp * a % c

print(oprt(a,b,c))