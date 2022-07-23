//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/07.
//  1로 만들기 DP

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)

for i in 2 ..< n+1 {
    dp[i] = dp[i-1] + 1
    
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2] + 1)
    }
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i/3] + 1)
    }
}

print(dp[n])
