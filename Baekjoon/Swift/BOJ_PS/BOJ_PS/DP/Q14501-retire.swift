//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/10.
//  퇴사 DP

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var counsels = [[Int]]()
    var dp = [Int](repeating: 0, count: n+1)
    var maxVal = 0
    
    for _ in 0..<n {
        counsels.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    for i in stride(from: n-1, through: 0, by: -1) {
        let day = counsels[i][0] + i
        
        if day <= n {
            dp[i] = max(counsels[i][1] + dp[day], maxVal)
            maxVal = dp[i]
        } else {
            dp[i] = maxVal
        }
    }
    return dp.max()!
}

print(solution())
