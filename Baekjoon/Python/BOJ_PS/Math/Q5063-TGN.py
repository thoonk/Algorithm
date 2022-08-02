# TGN / 수학

for i in range(int(input())):
    r, e, c = map(int, input().split())
    revenue = e - c

    if r < revenue:
        print("advertise")
    elif r > revenue:
        print("do not advertise")
    else:
        print("does not matter")