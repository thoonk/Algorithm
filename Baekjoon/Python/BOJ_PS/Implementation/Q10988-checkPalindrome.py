# 팰린드롬인지 확인하기 / 구현
input = list(input())
isPalindrome = True
for i in range(len(input) // 2):
    if input[i] != input[len(input) - i - 1]:
        isPalindrome = False

print(1 if isPalindrome else 0)