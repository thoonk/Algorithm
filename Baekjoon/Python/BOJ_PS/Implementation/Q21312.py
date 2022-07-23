# 홀짝 칵테일 / 구현
beverages = list(map(int, input().split()))
res = 1
isOdd = False
for beverage in beverages:
    if beverage % 2 == 1:
        res *= beverage
        isOdd = True

print(res if isOdd == True else beverages[0]*beverages[1]*beverages[2])