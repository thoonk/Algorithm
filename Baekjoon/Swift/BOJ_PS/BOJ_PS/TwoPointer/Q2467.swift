//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/08.
//  용액 / 투포인터

let n = Int(readLine()!)!
var liquid = readLine()!.split(separator: " ").map { Int(String($0))! }
var start = 0
var end = n-1
var sum = 0
var minVal = Int.max
var res = (0,0)

while start < end {
    sum = liquid[start] + liquid[end]
    
    if abs(sum) < minVal {
        res = (start, end)
        minVal = abs(sum)
    }
    
    if sum > 0 {
        end -= 1
    } else {
        start += 1
    }
}

print(liquid[res.0], liquid[res.1])
