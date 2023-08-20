# 가장 긴 바이토닉 부분 수열 / DP
n = int(input())
nums = list(map(int, input().split()))
reverse_nums = nums[::-1]
lis = [1 for _ in range(n)]
lds = [1 for _ in range(n)]

for i in range(n):
    for j in range(i):
        if nums[i] > nums[j]:
            lis[i] = max(lis[i], lis[j] + 1)
for i in range(n):
    for j in range(i):
        if reverse_nums[i] > reverse_nums[j]:
            lds[i] = max(lds[i], lds[j] + 1)

lds.reverse()
result = [0 for _ in range(n)]
for i in range(n):
    result[i] = lis[i] + lds[i] - 1
print(max(result))