//
//  Q2193.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/07/03.
//  이친수 / 다이나믹 프로그래밍

let n = Int(readLine()!)!
var dp = [0,1]

// 이친수의 개수는 피보나치 수와 같다는 규칙을 이용
for i in 2..<n+1 {
    dp.append(dp[i-2] + dp[i-1])
}

print(dp[n])
