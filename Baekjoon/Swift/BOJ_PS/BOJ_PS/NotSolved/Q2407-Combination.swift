//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/18.
//  2407 조합 arithmetic overflow ,,

import Foundation

func factorial(_ n: Int) -> UInt64 {
    var result: UInt64 = 1
    for i in 0 ..< n {
        result *= UInt64(i) + 1
    }
    return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
var m = nm[1]

if m > (n / 2) {
    m = n - m
}

let result = factorial(n) / (factorial(n-m) * factorial(m))
print(result)
//var dp = [[Int]](repeating: [Int](repeating: 0, count: 101), count: 101)
//
//for i in 0 ..< n + 1 {
//    for j in 0 ..< i + 1 {
//        if j == 0 {
//            dp[i][j] = 1
//        } else if j == 1 {
//            dp[i][j] = 1
//        } else {
//            dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
//        }
//    }
//}
//
//print(dp[n][m])


