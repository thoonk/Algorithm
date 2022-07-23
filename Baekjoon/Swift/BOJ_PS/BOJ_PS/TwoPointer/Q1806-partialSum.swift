//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/19.
//  부분합 투 포인터

let ns = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = ns[0]
let s = ns[1]

var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var end = 0
var sum = 0
var lens = [Int]()

for start in 0 ..< n {
    while sum < s && end < n {
        sum += nums[end]
        end += 1
    }
    
    let len = end - start
    
    if sum >= s {
        lens.append(len)
    }
    
    sum -= nums[start]
}

print(lens.min() ?? 0)
