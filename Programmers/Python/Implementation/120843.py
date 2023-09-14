# 공 던지기
def solution(numbers, k):
    return numbers[(2 * (k - 1)) % len(numbers)]        
