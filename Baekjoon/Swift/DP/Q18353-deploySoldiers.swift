//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/07.
//  병사 배치하기 DP, LIS

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    let soldiers = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = [Int](repeating: 1, count: n)
    
    for i in 1..<n {
        for j in 0..<i {
            if soldiers[j] > soldiers[i] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    return n-dp.max()!
}

print(solution())
