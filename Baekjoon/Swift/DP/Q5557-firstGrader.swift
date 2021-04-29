//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/29.
//  1학년 DP

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [[Int]](repeating: [Int](repeating: 0, count: 21), count: n)

dp[0][nums[0]] = 1

for i in 1 ..< n-1 {
    for j in 0 ..< 21 {
        if dp[i-1][j] != 0 {
            let plusNext = j + nums[i]
            let minusNext = j - nums[i]
            
            if 0 <= plusNext, plusNext <= 20 {
                dp[i][plusNext] += dp[i-1][j]
            }
            if 0 <= minusNext, minusNext <= 20 {
                dp[i][minusNext] += dp[i-1][j]
            }
        }
    }
}
print(dp[n-2][nums[n-1]])
