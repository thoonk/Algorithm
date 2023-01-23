# 대표값2 / 정렬

nums = []
for _ in range(5):
    nums.append(int(input()))
nums.sort()

avg = int(sum(nums) / 5)
mid = nums[2]
print(avg, mid, sep='\n')