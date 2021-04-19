//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/19.
//  수들의 합2 투 포인터

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var end = 0
var sum = 0
var cnt = 0

for start in 0 ..< n {
    while sum < m && end < n {
        sum += nums[end]
        end += 1
    }
    
    if sum == m {
        cnt += 1
    }
    sum -= nums[start]
}

print(cnt)
