//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/17.
//  2xn타일링2 DP

func solution() -> Int {
    dp[1] = 1
    dp[2] = 3
    
    guard n > 2 else {
        return dp[n]
    }
    
    for i in 3 ..< n + 1 {
        dp[i] = (dp[i-1] + dp[i-2] * 2) % 10007
    }
    return dp[n]
}

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1001)
print(solution())

