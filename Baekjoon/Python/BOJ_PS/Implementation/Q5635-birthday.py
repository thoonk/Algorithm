# 생일 / 구현

n = int(input())
students = []
for i in range(n):
    student = list(map(str, input().split()))
    students.append(student)

students.sort(key= lambda x: (int(x[3]), int(x[2]), int(x[1])))
print(students[n - 1][0], students[0][0], sep='\n')