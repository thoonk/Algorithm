hour, min = map(int, input().split())
cost = int(input())
sum = min + cost

if sum >= 60:
    hour += sum // 60
    min = sum % 60
else:
    min = sum

if hour >= 24:
    hour -= 24

print(hour, min)