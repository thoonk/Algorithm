# 무지의 먹방 라이브 / 그리드
import heapq

def solution(food_times, k):
    result = 0
    
    if sum(food_times) <= k:
        return -1
    
    q = []
    for i in range(len(food_times)):
        heapq.heappush(q, (food_times[i], i + 1))
        
    prev_time = 0 
    sum_time = 0
    food_count = len(food_times)
    
    while sum_time + (q[0][0] - prev_time) * food_count <= k:
        now = heapq.heappop(q)[0]
        sum_time += (now - prev_time) * food_count
        prev_time = now
        food_count -= 1
    
    result = sorted(q, key=lambda x: x[1])
    return result[(k - sum_time) % food_count][1]

