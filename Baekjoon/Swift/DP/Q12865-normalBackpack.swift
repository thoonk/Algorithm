//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/25.
//  12865 평범한 배낭 DP

import Foundation

typealias Stuff = (w: Int, v: Int)

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var stuff = [Stuff]()
var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)

stuff.append((0,0))

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    stuff.append((input[0], input[1]))
}

for i in 1..<n+1 {
    for j in 1..<k+1 {
        if j >= stuff[i].w {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-stuff[i].w] + stuff[i].v)
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[n][k])
