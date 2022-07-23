# 별 찍기 - 10 / 재귀
import sys
n = int(sys.stdin.readline())
def printStar(r, c):
    while r > 0:
        if r % 3 == 1 and c % 3 == 1:
            sys.stdout.write(' ')
            return
        r //= 3
        c //= 3
    sys.stdout.write('*')

for r in range(n):
    for c in range(n):
        printStar(r, c)
    sys.stdout.write('\n')
