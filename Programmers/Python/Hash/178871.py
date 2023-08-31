# 달리기 경주 / 해시
def solution(players, callings):
    players_dict = {player: rank for rank, player in enumerate(players)}
    for calling in callings:
        rank = players_dict[calling]
        players_dict[calling] -= 1
        players_dict[players[rank - 1]] += 1

        players[rank - 1], players[rank] = calling, players[rank - 1]

    return players

print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
