def make_max_cable(cables, n):
    start, end = 1, max(cables)
    
    while start <= end:
        mid = (start + end) // 2
        cables_count = 0
        
        for cable in cables:
            cables_count += cable // mid
        
        if cables_count >= n:
            start = mid + 1
        else:
            end = mid - 1
    
    return end

k, n = map(int, input().split())
cables = []
for _ in range(k):
    cables.append(int(input()))

print(make_max_cable(cables, n))