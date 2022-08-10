n = int(input())
count = 0

for i in range(n):
    a = int(input())
    if a == 1:
        count += 1

if count > n // 2:
    print('Junhee is cute!')
else:
    print('Junhee is not cute!')
