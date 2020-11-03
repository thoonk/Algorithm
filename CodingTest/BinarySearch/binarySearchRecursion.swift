//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  이진 탐색 (재귀)

import Foundation

var input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
let target = input[1]

var arr = readLine()!.split(separator: " ").map {Int($0)!}
arr.sort()

var result = binarySearch(arr, target, 0, n-1)
if result == -1 {
    print("원소가 존재하지 않음")
} else{
    print(result+1)
}

func binarySearch(_ array: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
    
    if start > end{
        return -1
    }
    let mid: Int = (start + end) / 2
    
    if array[mid] == target{
        return mid
    } else if array[mid] > target{
        return binarySearch(array, target, start, mid-1)
    } else{
        return binarySearch(array, target, mid+1, end)
    }
}
