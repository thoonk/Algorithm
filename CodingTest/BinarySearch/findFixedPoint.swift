//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/12/09.
//  고정점 찾기 이진탐색

import Foundation

let n = Int(readLine()!)!

let nums = readLine()!.split(separator: " ").map {Int(String($0))!}


print(nums.binarySearch())

extension Array where Element == Int {
    
    func binarySearch() -> Int {
        var start = 0
        var end = self.count-1
        
        while start <= end {
            let mid = (start+end)/2
            if self[mid] == mid {
                return mid
            } else if self[mid] > mid {
                end = mid-1
            } else {
                start = mid+1
            }
        }
        return -1
    }
}

/*
5
-15 -6 1 3 7
*/
