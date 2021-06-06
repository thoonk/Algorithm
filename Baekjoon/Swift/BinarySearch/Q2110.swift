//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/09.
//  공유기 설치 이진탐색

import Foundation

let nc = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nc[0]
let c = nc[1]
var homes = [Int]()

for _ in 0 ..< n {
    homes.append(Int(readLine()!)!)
}

homes.sort()
print(homes.binarySearch(c))

extension Array where Element == Int {
    
    func binarySearch(_ c: Int) -> Int {
        var result = 0
        var start = 1
        var end = self.last!-self[0]

        while start <= end {
            let mid = (start+end)/2
            var install = self[0]
            var cnt = 1
            
            for i in 1 ..< n {
                if self[i] >= install + mid {
                    install = self[i]
                    cnt += 1
                }
            }
            if cnt >= c {
                start = mid+1
                result = mid
            } else {
                end = mid-1
            }
        }
        return result
    }
}
