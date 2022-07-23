# 카드 놓기 / 브루트포스, 집합
import sys

def makeNum(depth):
    if depth == k:
        cardSet.add(''.join(map(str,cards)))
        return

    for i in range(n):
        if check[i] == False:
            cards.append(nums[i])
            check[i] = True
            makeNum(depth+1)
            cards.pop()
            check[i] = False

n = int(sys.stdin.readline())
k = int(sys.stdin.readline())
nums = []
cards = []
cardSet = set()
check = [False] * n

for _ in range(n):
    nums.append(int(sys.stdin.readline()))
makeNum(0)
print(len(cardSet))
    