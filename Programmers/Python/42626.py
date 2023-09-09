import heapq

'''
1. 스코빌 지수 힙소트 정렬
2. 모든 스코빌 지수 K 이상이 될 때 까지 섞기 
3. 섞인 횟수 출력
'''

def solution(scoville, K):
    answer = 0
    h = []
    for s in scoville:
        heapq.heappush(h, s)
    
    while h[0] < K:
        heapq.heappush(h, heapq.heappop(h) + heapq.heappop(h) * 2)
        answer += 1
        
        if len(h) == 1 and h[0] < K:
            return -1
    
    return answer
