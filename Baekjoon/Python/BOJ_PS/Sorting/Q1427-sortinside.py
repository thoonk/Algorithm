# 소트인사이드 / 정렬

N = list(map(int, input()))
N.sort(reverse=True)
for i in N:
    print(i, end='')