# 공유기 설치 / 이분탐색
n,c = map(int, input().split())
homes = [int(input()) for _ in range(n)]
homes.sort()

start = 1
end = homes[-1] - homes[0]
result = 0

while (start <= end):
    mid = (start + end) // 2 
    install = homes[0]
    cnt = 1

    for i in range(1, n):
        if homes[i] >= install + mid:
            cnt += 1
            install = homes[i]
    
    if cnt >=c:
        start = mid + 1
        result = mid
    else:
        end = mid - 1

print(result)