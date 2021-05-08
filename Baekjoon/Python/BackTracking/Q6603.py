# 로또 / 백트래킹, 순열
import sys

def selectNums(index, cnt, nums, selected):
    if cnt == 6:
        for i in range(len(selected)):
            if selected[i] == True: 
                print(nums[i], end=' ')
        print()
        return
    if index >= k:
        return

    selected[index] = True
    selectNums(index+1, cnt+1, nums, selected)
    selected[index] = False
    selectNums(index+1, cnt, nums, selected)


input = sys.stdin.readline
while True:
    n = list(map(int, input().split()))
    k = n[0]
    if k == 0:
        break
    nums = n[1:]
    selected = [False] * k
    selectNums(0,0,nums,selected)
    print()