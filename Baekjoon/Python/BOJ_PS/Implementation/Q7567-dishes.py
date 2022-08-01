# 그릇 / 구현, 문자열

dishes = list(input())
result = 10

for i in range(1, len(dishes)):
    if dishes[i - 1] == dishes[i]:
        result += 5
    else:
        result += 10

print(result)