# 알고리즘 수업 - 병합 정렬 1 / 재귀
N, K = map(int, input().split())
A = list(map(int, input().split()))
result = -1
count = 0

def merge_sort(A, p, r):
    if p < r:
        q = (p + r) // 2
        merge_sort(A, p, q)
        merge_sort(A, q + 1, r)
        merge(A, p, q, r)

def merge(A, p, q, r):
    global count, result
    i, j, t = p, q + 1, 1
    temp = []
    while i <= q and j <= r:
        if A[i] <= A[j]:
            temp.append(A[i])
            i += 1
        else:
            temp.append(A[j])
            j += 1
    while i <= q:
        temp.append(A[i])
        i += 1
    while j <= r:
        temp.append(A[j])
        j += 1

    i, t = p, 0
    while i <= r:
        A[i] = temp[t]
        count += 1
        if count == K:
            result = A[i]
            break
        i += 1
        t += 1

merge_sort(A, 0, N - 1)
print(result)