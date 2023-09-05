# 대충 만든 자판 / 구현
def solution(keymap, targets):
    answer = []

    for target in targets:
        count = 0
        for alphabet in target:
            temp = 101
            is_empty = True

            for keys in keymap:
                if alphabet in keys:
                    temp = min(temp, keys.index(alphabet) + 1)
                    is_empty = False
            if is_empty:
                count = -1
                break

            count += temp
        answer.append(count)

    return answer

print(solution(["ABACD", "BCEFD"], ["ABCD","AABB"]))
