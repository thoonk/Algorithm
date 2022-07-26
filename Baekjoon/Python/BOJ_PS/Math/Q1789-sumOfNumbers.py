s = int(input())
n = 0
result = 0

for i in range(1, s+1):
    n += i
    result += 1
    if n > s:
        result -= 1
        break

print(result)
