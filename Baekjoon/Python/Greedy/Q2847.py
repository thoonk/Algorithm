# 게임을 만든 동준이 / 그리드 
n = int(input())
nums = [int(input()) for _ in range(n)]
res = 0

for i in range(n-1, 0, -1):
    if nums[i] <= nums[i-1]:
        res += nums[i-1] - nums[i] + 1
        nums[i-1] = nums[i] - 1
print(res)

