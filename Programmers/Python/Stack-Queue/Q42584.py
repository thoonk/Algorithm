# 주식가격 / 스택
prices = [1,2,3,2,3]
def solution(prices):
    answer = [0 for _ in range(len(prices))]
    stack = []
    
    for i, price in enumerate(prices):
        # 떨어진 주식 찾기
        while stack and prices[stack[-1]] > price:
            prev = stack.pop()
            answer[prev] = i - prev
        stack.append(i)

    while stack: 
        i = stack.pop() 
        # 떨어지지 않은 만큼의 시간으로 갱신
        answer[i] = len(prices) - i - 1
    return answer
print(solution(prices))
