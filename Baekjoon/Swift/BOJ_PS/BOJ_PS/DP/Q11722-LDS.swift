//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/09.
//  가장 긴 감소하는 부분 수열 DP

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = [Int](repeating: 1, count: n)
    
    for i in 1..<n {
        for j in 0..<i {
            if nums[j] > nums[i] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    return dp.max()!
}

print(solution())
