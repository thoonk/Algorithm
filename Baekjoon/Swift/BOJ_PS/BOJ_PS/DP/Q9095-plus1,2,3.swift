//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/15.
//  1, 2, 3 더하기 DP

let t = Int(readLine()!)!
var dp = [1,2,4]
var nums = [Int]()

for i in 3 ..< 10 {
    dp.append(dp[i-1] + dp[i-2] + dp[i-3])
}

for _ in 0 ..< t {
    let n = Int(readLine()!)!
    print(dp[n-1])
}
