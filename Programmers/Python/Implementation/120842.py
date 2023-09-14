# 2차원으로 만들기 
def solution(num_list, n):
    answer = []
    i = 0
    temp = []

    while i < len(num_list):
        temp.append(num_list[i])
        if (i + 1) % n == 0:
            answer.append(temp)
            temp = []
        i += 1
    
    return answer
