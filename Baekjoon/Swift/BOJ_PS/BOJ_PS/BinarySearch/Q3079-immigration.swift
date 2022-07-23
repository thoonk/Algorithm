//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/21.
//  입국심사 이분탐색

func binarySearch() {
    var result = m * times[n-1]
    var start = 0
    var end = m * times[n-1]
    while start <= end {
        let mid = (start+end) / 2
        var total = 0
        
        for i in 0 ..< n {
            total += mid / times[i]
        }
        
        if total >= m {
            result = min(result, mid)
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    print(result)
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var times = [Int]()

for _ in 0 ..< n {
    times.append(Int(readLine()!)!)
}

times.sort()
binarySearch()
