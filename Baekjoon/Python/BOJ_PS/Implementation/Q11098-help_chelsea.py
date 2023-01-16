# 첼시를 도와줘! / 구현
n = int(input())

for _ in range(n):
    num_player = int(input())
    best_player = (0, '')
    for i in range(num_player):
        player = list(map(str, input().split()))
        if int(player[0]) > int(best_player[0]):
            best_player = (player[0], player[1])

    print(best_player[1])