# 베스트셀러 해싱, 정렬
import sys
from collections import Counter
input = sys.stdin.readline

n = int(input())
books = []
for _ in range(n):
    books.append(input())

books.sort()
soldCounter = Counter(books)
print(soldCounter.most_common(1)[0][0])