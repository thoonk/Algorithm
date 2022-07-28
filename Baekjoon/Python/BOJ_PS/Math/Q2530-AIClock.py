hour, min, sec = map(int, input().split())
cost = int(input())

sec += cost
min += sec // 60
hour += min // 60

print(hour % 24, min % 60, sec % 60)
