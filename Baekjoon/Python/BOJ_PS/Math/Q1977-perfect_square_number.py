# 완전제곱수 / 수학

m = int(input())
n = int(input())
square_list = []

for i in range(0, n + 1):
    if m <= i ** 2 <= n:
        square_list.append(i ** 2)

if not square_list:
     print(-1)
else:
    print(sum(square_list))
    print(min(square_list))