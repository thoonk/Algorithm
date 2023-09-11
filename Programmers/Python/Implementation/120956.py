# 옹알이 (1)
from itertools import permutations

def solution(babbling):
    answer = 0
    pronounces = ['aya', 'ye', 'woo', 'ma']
    word = []
    
    for i in range(1, 5):
        for char in permutations(pronounces, i):
            word.append(''.join(char))
    
    for babble in babbling:
        if babble in word:
            answer += 1
            
    return answer
