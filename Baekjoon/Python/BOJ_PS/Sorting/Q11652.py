# 카드 / 정렬
cards = {}
for _ in range(int(input())):
    n = int(input())
    
    if n in cards: 
        cards[n] += 1
    else:
        cards[n] = 1

res = sorted(cards.items(), key= lambda x: (-x[1], x[0]))
print(res[0][0])