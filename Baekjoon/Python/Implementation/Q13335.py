# 트럭 / 구현, 시뮬레이션
import sys
input = sys.stdin.readline
n, w, l = map(int, input().split())
trucks = list(map(int, input().split()))
q = []
time = 0

while len(trucks) > 0 or len(q) > 0:
    time += 1
    
    if q and time - q[0][1] == w:
        l += q.pop(0)[0]
    
    if trucks and trucks[0] <= l:
        truck = trucks.pop(0)
        l -= truck
        q.append([truck, time])

print(time)