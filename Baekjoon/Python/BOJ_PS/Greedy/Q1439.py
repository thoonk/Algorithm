# 뒤집기 / 그리디
zero = 0
one = 0
s = input()
def counting(n):
    global zero, one
    if n == '0':
        zero += 1
    else:
        one += 1

counting(s[0])
for i in range(1, len(s)):
    if s[i-1] != s[i]:
        counting(s[i])
print(min(zero,one))
