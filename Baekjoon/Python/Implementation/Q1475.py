# 방 번호 / 구현
import sys
import math 
n = list(map(int, sys.stdin.readline().strip()))
cnt = [0] * 9

for k in n:
    print(type(k))
    if k == 6 or k == 9:
        cnt[6] += 0.5
    else:
        cnt[k] += 1
print(math.ceil(max(cnt)))