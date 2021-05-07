//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/07.
//  포도주 시식 DP

let n = Int(readLine()!)!
var wine = [Int]()
var dp = [Int](repeating: 0, count: n)

for _ in 0 ..< n {
    wine.append(Int(readLine()!)!)
}

func solution() -> Int {
    if n == 1 {
        return wine[0]
    } else if n == 2 {
        return wine[0] + wine[1]
    } else {
        dp[0] = wine[0]
        dp[1] = max(wine[0] + wine[1], wine[1])
        dp[2] = max(dp[1], wine[0] + wine[2], wine[1] + wine[2])
        for i in 3 ..< n {
            // 이번에 안 마실 때, 이번에 마시고 직전에 안 마셨을 때, 이번과 직전에 마시고 그 전에 안 마셨을 때
            dp[i] = max(dp[i-2] + wine[i], dp[i-3] + wine[i-1] + wine[i])
            // 2번 연속 안 마실 때
            dp[i] = max(dp[i-1], dp[i])
        }
        return dp[n-1]
    }
}

print(solution())
