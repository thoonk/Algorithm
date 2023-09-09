# 여행경로 / DFS-BFS
from collections import defaultdict

def solution(tickets):
    answer = []
    routes = defaultdict(list)
    for ticket in tickets:
        routes[ticket[0]].append(ticket[1])
    for key in routes.keys():
        routes[key].sort(reverse=True)

    stack = ['ICN']
    
    while stack:
        top = stack[-1]
        if not routes[top]:
            answer.append(stack.pop())
        else:
            stack.append(routes[top].pop())
    answer.reverse()
    return answer


