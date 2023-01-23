# 행렬 덧셈 / 수학

N, M = map(int, input().split())
A = []
for i in range(N * 2):
    if i < N:
        A.append(list(map(int, input().split())))
    else:
        B = list(map(int, input().split()))
        for j in range(M):
            A[i - N][j] += B[j]

for i in range(N):
    for j in range(M):
        print(A[i][j], end=' ')
    print()