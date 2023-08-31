# 추억 점수 / 해시
def solution(name, yearning, photo):
    answer = []
    dict = {}

    for i in range(len(name)):
        dict[name[i]] = yearning[i]
    for i in range(len(photo)):
        temp = 0
        for j in photo[i]:
            if j in name:
                temp += dict[j]
        answer.append(temp)

    return answer

print(solution(
    ["may", "kein", "kain", "radi"],
    [5, 10, 1, 3],
    [
        ["may", "kein", "kain", "radi"],
        ["may", "kein", "brin", "deny"],
        ["kon", "kain", "may", "coni"]
    ]
))

# [19, 15, 6]
