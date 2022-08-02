# 개표 / 문자열

v = int(input())
votes = list(input())

if votes.count('A') > v / 2:
    print('A')
elif votes.count('B') > v / 2:
    print('B')
else:
    print("Tie")