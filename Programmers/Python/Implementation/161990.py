# 바탕화면 정리 / 구현
def solution(wallpaper):
    answer = []
    w = len(wallpaper)
    h = len(wallpaper[0])
    start = [w, h]
    end = [-1, -1]

    for i in range(len(wallpaper)):
        print(wallpaper[i])
        for j in range(len(wallpaper[0])):
            if wallpaper[i][j] == '#':
                start[0] = min(i, start[0])
                start[1] = min(j, start[1])
                end[0] = max(i, end[0])
                end[1] = max(j, end[1])
    end = [end[i] + 1 for i in range(len(end))]
    return start + end

wallpaper = [".#...", "..#..", "...#."]
print(solution(wallpaper))
