//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  부품 찾기 (이진 탐색)

import Foundation

let n = Int(readLine()!)!
var remainPart = readLine()!.split(separator: " ").map {Int($0)!}
// 이진 탐색을 사용하기 위해 정렬
remainPart.sort()

let m = Int(readLine()!)!
var requestPart = readLine()!.split(separator: " ").map {Int($0)!}

for i in requestPart {
    let result = binarySearch(remainPart, i)
    if result == true{
        print("yes", terminator: " ")
    } else {
        print("no", terminator: " ")
    }
}

func binarySearch(_ arr: [Int], _ target: Int) -> Bool {
    var start = 0
    var end = arr.count-1
    while start <= end{
        let mid = (start + end) / 2
        
        if arr[mid] == target{
            return true
        }else if arr[mid] > target {
            end = mid-1
        } else {
            start = mid+1
        }
    }
    return false
}

/*
 5
 8 3 7 9 2
 3
 5 7 9
 */
