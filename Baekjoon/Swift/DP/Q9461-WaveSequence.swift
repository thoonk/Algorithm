//
//  Q9461-WaveSequence.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/05/03.
//  파도반 수열 DP

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: 101)
    dp[1] = 1
    dp[2] = 1
    dp[3] = 1
    
    for i in 4..<101 {
        dp[i] = dp[i-2] + dp[i-3]
    }
    
    print(dp[input])
}
