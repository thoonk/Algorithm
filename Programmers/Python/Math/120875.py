# 평행 / 수학
def solution(dots):
    p1, p2, p3, p4 = dots

    if slope(p1, p3) == slope(p2, p4) or slope(p1, p2) == slope(p3, p4):
        return 1
    else:
        return 0


def slope(a, b):
    return (a[1] - b[1]) / (a[0] - b[0])

print(solution([[1, 4], [9, 2], [3, 8], [11, 6]]))