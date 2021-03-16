//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/15.
// 2293 동전 1 DP

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]

var coins = [Int](repeating: 0, count: 101)
var dp = [Int](repeating: 0, count: 10001)

for i in 0..<n {
    let input = Int(readLine()!)!
    coins[i] = input
}

dp[0] = 1

for i in 0..<n {
    if coins[i] > k {
        continue
    } else {
        
        for j in coins[i]...k {
            dp[j] += dp[j-coins[i]]
            if dp[j] > Int(pow(2.0, 31.0)) {
                dp[j] = 0
            }
        }
    }
}

print(dp[k])



