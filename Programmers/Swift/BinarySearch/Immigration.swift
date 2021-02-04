//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/02/04.
//  입국심사 Level3

import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    
    let times = times.sorted()
    return times.binarySearch(n)
}

extension Array where Element == Int {
    func binarySearch(_ n: Int) -> Int64 {
        var min: Int64 = 1
        var max: Int64 = Int64(self[self.count-1] * n)
        var result = max
        while min <= max {
            let mid: Int64 = (min+max)/2
            var sum: Int64 = 0
            self.forEach {
                sum += mid/Int64($0)
            }
            if sum < n {
                min = mid+1
            } else {
                if mid <= result {
                    result = mid
                }
                max = mid-1
            }
        }
        return result
    }
}

print(solution(6, [7,10]))
