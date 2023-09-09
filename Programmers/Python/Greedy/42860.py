# 조이스틱 / 그리디
def solution(name):
    alphabet_move = 0
    cursor_move = len(name) - 1
    
    for i, char in enumerate(name):
        alphabet_move += min(ord(char) - ord('A'), ord('Z') - ord(char) + 1)
        
        next = i + 1
        while next < len(name) and name[next] == 'A':
            next += 1
            
        cursor_move = min(cursor_move, 2 * i + len(name) - next, i + 2 * (len(name) - next))
        
    
    return alphabet_move + cursor_move
