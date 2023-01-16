# 24 / 수학

c_hour, c_min, c_sec = list(map(int, input().split(':')))
s_hour, s_min, s_sec = list(map(int, input().split(':')))

c_time = 3600 * c_hour + 60 * c_min + c_sec
s_time = 3600 * s_hour + 60 * s_min + s_sec

result = s_time - c_time
if result < 0:
    result += 3600 * 24

print('%02d:%02d:%02d' % (result // 3600, (result % 3600) // 60, result % 60))
