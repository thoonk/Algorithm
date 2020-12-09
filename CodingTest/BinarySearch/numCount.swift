//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/12/09.
//  정렬된 배열에서 특정 수의 개수 구하기 BinarySearch

import Foundation

let nx = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nx[0]
let x = nx[1]

var nums: [Int] = readLine()!.split(separator: " ").map {Int(String($0))!}

if nums.binarySearchFirst(x) == -1 {
    print(-1)
} else {
    print(nums.binarySearchLast(x)-nums.binarySearchFirst(x)+1)
}

extension Array where Element == Int {
    
    func binarySearchFirst(_ target: Int) -> Int {
        var start = 0
        var end = self.count-1
        while start <= end {
            let mid = (start+end)/2
            
            if mid == 0 || target > self[mid-1], self[mid] == target {
                return mid
            } else if self[mid] >= target {
                end = mid-1
            } else{
                start = mid+1
            }
        }
        return -1
    }
    
    func binarySearchLast(_ target: Int) -> Int {
        var start = 0
        var end = self.count-1
        while start <= end {
            let mid = (start+end)/2
            
            if mid == self.count-1 || target < self[mid+1], self[mid] == target {
                return mid
            } else if self[mid] > target {
                end = mid-1
            } else {
                start = mid+1
            }
        }
        return -1
    }
}

/*
7 2
1 1 1 2 2 2 2 3
*/
