//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/23.
//  퇴사2 DP

let n = Int(readLine()!)!
var schedules = [[Int]]()
var dp = [Int](repeating: 0, count: n+1)

for _ in 0 ..< n {
    schedules.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in stride(from: n-1, through: 0, by: -1) {
    let afterDay = schedules[i][0] + i

    if afterDay <= n {
        print(afterDay)
        dp[i] = max(dp[i+1], schedules[i][1] + dp[afterDay])
    } else {
        dp[i] = dp[i+1]
    }
    print(schedules, dp)
}

print(dp.max()!)

