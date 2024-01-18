# 외계어 사전 / 조합
from itertools import permutations

def solution(spell, dic):
    for alpha in list(permutations(spell, len(spell))):
        if ''.join(list(alpha)) in dic:
            return 1

    return 2

print(solution(["p", "o", "s"], ["sod", "eocd", "qixm", "adio", "soo"]))