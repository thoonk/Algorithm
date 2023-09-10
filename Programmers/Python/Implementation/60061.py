'''
기둥 또는 보 설치 / 구현
1. 구조물 설치 또는 삭제
1.1. 구조물 삭제 시 삭제 후 규칙 맞는지 확인 
1.2. 아니라면 다시 추가
1.3. 구조물 추가 시 추가 후 규칙 맞는지 확인 
1.4  아니라면 다시 삭제

2. 설치 및 삭제마다 구조물이 완성 가능한지 확인
2-1. 설치 타입이 기둥일 때 바닥 위, 보의 한쪽 끝 부분 위, 다른 기둥 위 -> 컨티뉴
2-2. 아니라면 False
2-3. 설치 타입이 보일 때 끝 부분이 기둥 위, 양쪽 끝부분이 다른 보와 연결 -> 컨티뉴
2-4. 아니라면 False
'''
def solution(n, build_frame):
    answer = []
    
    for x, y, a, b in build_frame:
        # 구조물 삭제
        if b == 0:
            answer.remove([x, y, a])
            if not buildable(answer):
                answer.append([x, y, a])
        # 구조물 설치
        if b == 1:
            answer.append([x, y, a])
            if not buildable(answer):
                answer.remove([x, y, a])
                
    return sorted(answer) 

def buildable(result):
    for x, y, type in result:
        # 기둥
        if type == 0:
            if (y == 0
            or [x - 1, y, 1] in result 
            or [x, y, 1] in result 
            or [x, y - 1, 0] in result):
                continue
                
            return False
        # 보
        elif type == 1: 
            if ([x, y - 1, 0] in result 
                or [x + 1, y - 1, 0] in result 
                or [x - 1, y, 1] in result
                and [x + 1, y, 1] in result):
                    continue
            return False
    return True
    
