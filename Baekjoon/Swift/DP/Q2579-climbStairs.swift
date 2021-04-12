//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/12.
//  계단 오르기 DP

func solution() -> Int {
    if n == 1 {
        return stairs[0]
    } else if n == 2 {
        return stairs[0] + stairs[1]
    } else  {
        dp[0] = stairs[0]
        dp[1] = max(stairs[0] + stairs[1], stairs[1])
        dp[2] = max(stairs[0] + stairs[2], stairs[1] + stairs[2])
        
        for i in 3 ..< n {
            dp[i] = max(dp[i-3] + stairs[i-1] + stairs[i], dp[i-2] + stairs[i])
        }
        return dp[n-1]
    }
}

let n = Int(readLine()!)!
var stairs = [Int]()
var dp = [Int](repeating: 0, count: n)

for _ in 0 ..< n {
    stairs.append(Int(readLine()!)!)
}
print(solution())

