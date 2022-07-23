import sys
input = sys.stdin.readline

def count_edible(candies, n):
    max_count = 1

    for i in range(n):
        count = 1
        for j in range(1, n):
            if candies[i][j] == candies[i][j-1]:
                count += 1
            else:
                count = 1

            if max_count < count:
                max_count = count

        count = 1

        for j in range(1, n):
            if candies[j-1][i] == candies[j][i]:
                count += 1
            else:
                count = 1
            if max_count < count:
                max_count = count

    return max_count

n = int(input())
candies = [list(input()) for _ in range(n)]
result = 0

for i in range(n):
    for j in range(n):
        if j+1 < n:
            candies[i][j], candies[i][j+1] = candies[i][j+1], candies[i][j]

            max_count = count_edible(candies, n)
            if result < max_count:
                result = max_count

            candies[i][j], candies[i][j+1] = candies[i][j+1], candies[i][j]
        if i+1 < n:
            candies[i][j], candies[i+1][j] = candies[i+1][j], candies[i][j]

            max_count = count_edible(candies, n)
            if result < max_count:
                result = max_count

            candies[i][j], candies[i + 1][j] = candies[i + 1][j], candies[i][j]

print(result)