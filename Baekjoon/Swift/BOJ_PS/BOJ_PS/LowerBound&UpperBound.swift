//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/29.
//

func lowerBounds(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    
    while start < end {
        let mid = (start + end) / 2
        
        if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return end
}

func upperBounds(arr: [Int], start: Int, end: Int, target: Int) -> Int {
    var start = start
    var end = end
    
    while start < end {
        let mid = (start + end) / 2
        
        if arr[mid] <= target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return end
}


var nums = [1,2,3,4,6,7]
var target = 2

print(lowerBounds(arr: nums, start: 0, end: nums.count-1, target: target))
print(upperBounds(arr: nums, start: 0, end: nums.count-1, target: target))


