# 사분면
q = [0] * 5
for i in range(int(input())):
    x, y = map(int, input().split())
    if x == 0 or y == 0:
        q[4] += 1
    elif x > 0 and y > 0:
        q[0] += 1
    elif x < 0 and y > 0:
        q[1] += 1
    elif x < 0 and y < 0:
        q[2] += 1
    elif x > 0 and y < 0:
        q[3] += 1

for i, count in enumerate(q):
    if i < len(q) - 1:
        print(f"Q{i+1}: {count}")
    else:
        print(f"AXIS: {count}")