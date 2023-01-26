# 좌표압축 / 정렬
N = int(input())
coords = list(map(int, input().split()))
temp = list(set(coords))
temp.sort()

dict = {}

for i, coord in enumerate(temp):
    dict[coord] = i

for coord in coords:
    print(dict[coord], end=' ')


'''
5
2 4 -10 4 -9
2, 3, 0, 3, 1
'''