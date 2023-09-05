# 공원산책 / 구현
def solution(park, routes):
    r, c = 0, 0
    d = {'E': (0, 1), 'W': (0, -1), 'S': (1, 0), 'N': (-1, 0)}
    for i in range(len(park)):
        for j in range(len(park[0])):
            if park[i][j] == 'S':
                r, c = i, j

    for route in routes:
        direction, distance = route.split()
        ir, ic = r, c
        for i in range(int(distance)):
            nr = r + d[direction][0]
            nc = c + d[direction][1]

            if 0 <= nr < len(park) and 0 <= nc < len(park[0]) and park[nr][nc] != 'X':
                r, c = nr, nc
            else:
                r, c = ir, ic
                break
    return (r, c)

park = ["SOO","OXX","OOO"]
routes = ["E 2","S 2","W 1"]
print(solution(park, routes))
