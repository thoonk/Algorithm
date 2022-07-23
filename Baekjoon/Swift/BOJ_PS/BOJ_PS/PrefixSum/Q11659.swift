//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/11.
//  구간 합 구하기4 / 누적합

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }

nums.insert(0, at: 0)

// 누적합 만들기
for i in 1 ..< n+1 {
    nums[i] += nums[i-1]
}

for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(nums[input[1]] - nums[input[0]-1])
}

