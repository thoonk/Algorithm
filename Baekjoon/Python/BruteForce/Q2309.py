# 일곱 난쟁이 / 브루트포스
import sys

dwarfs = [int(sys.stdin.readline()) for _ in range(9)]
dwarfs.sort()

total = sum(dwarfs)
for i in range(8):
    for j in range(i+1, 9):
        if total-(dwarfs[i]+dwarfs[j]) == 100: 
            for k in range(9): 
                if k==i or k==j:
                    continue
                else:
                    print(dwarfs[k])
            exit()

for dwarf in dwarfs: 
    print(dwarf)