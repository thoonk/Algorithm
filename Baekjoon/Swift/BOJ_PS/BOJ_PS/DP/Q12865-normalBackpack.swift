//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/25.
//  12865 평범한 배낭 DP

import Foundation

// w: weight, v: value
typealias Stuff = (w: Int, v: Int)

// n: 물품의 수, k: 버틸 수 있는 무게
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var stuff = [Stuff]()
// dp: 배낭에 최대로 넣을 수 있는 무게 내에서 최대의 가치
var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)

stuff.append((0,0))

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    stuff.append((input[0], input[1]))
}

for i in 1..<n+1 {
    // j: 배낭에 넣을 수 있는 무게
    for j in 1..<k+1 {
        if j >= stuff[i].w {
            // 해당 인덱스의 물건을 담지 않는 경우, 해당 인덱스의 물건을 담는 경우 중의 가치가 큰 값으로 갱신
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-stuff[i].w] + stuff[i].v)
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[n][k])
