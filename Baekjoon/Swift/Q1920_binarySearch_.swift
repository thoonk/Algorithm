//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/25.
//

import Foundation

let N = Int(readLine()!)!

var A =  readLine()!.split(separator: " ").map {Int($0)!}
A.sort()

let M = Int(readLine()!)!

let num = readLine()!.split(separator: " ").map {Int($0)!}

var result = [Int]()

for i in 0..<M {
    print(binarySearch(A, num[i]))
}

func binarySearch(_ arr1: [Int], _ n: Int) -> Int{
    
    if n < arr1[0]{
        return 0
    } else if n > arr1[arr1.count - 1] {
        return 0
    } else{
        var start = 0
        var end = arr1.count - 1
        var mid = (start + end) / 2
        
        while(end - start >= 0){
            mid = (start + end) / 2

            if arr1[mid] == n {
                return 1
            } else if arr1[mid] < n {
                start = mid + 1
            } else if arr1[mid] > n {
                end = mid - 1
            }
        }
    }
    return 0
}
