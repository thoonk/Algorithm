//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/14.
//  2xn타일링 DP

import Foundation

func solution() {
    dp[1] = 1
    dp[2] = 2
    
    guard n > 2 else {
        print(n)
        return
    }
    
    for i in 3 ..< n + 1 {
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }
    
    print(dp[n])
}

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1001)
solution()
