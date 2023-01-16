# 영수증 / 수학
total_price = int(input())
temp = 0
for _ in range(9):
    temp += int(input())

print(total_price - temp)