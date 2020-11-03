//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  이진 탐색 (반복문)

import Foundation

var input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
let target = input[1]

var arr = readLine()!.split(separator: " ").map {Int($0)!}
arr.sort()

var result = binarySearch(arr, target)
if result == -1 {
    print("원소가 존재하지 않음")
} else{
    print(result+1)
}

func binarySearch(_ array: [Int], _ target: Int) -> Int{
    var start = 0
    var end = array.count - 1
    while start <= end{
        let mid = (start + end) / 2
        if array[mid] == target{
            return mid
        } else if array[mid] > target{
            end = mid - 1
        } else{
            start = mid + 1
        }
    }
    return -1
}


