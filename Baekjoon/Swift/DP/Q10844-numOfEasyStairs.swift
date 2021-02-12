//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/11.
//  쉬운 계단 수 DP

import Foundation

func solution() -> Int {
    
    let mod = 1e9
    let n = Int(readLine()!)!
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 101)
    
    if n == 1 {
        return 9
    }
    
    for i in 1...9 {
        dp[1][i] = 1
    }
    
    for i in 2...n {
        for j in 0...9 {
            if j == 0 {
                dp[i][0] = dp[i-1][1] % Int(mod)
                print(dp[i])
            } else if j == 9 {
                dp[i][9] = dp[i-1][8] % Int(mod)
                print(dp[i])
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % Int(mod)
                print(dp[i])
            }
        }
    }
    return dp[n].reduce(0,+) % Int(mod)
}

print(solution())
