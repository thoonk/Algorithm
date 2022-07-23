//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/16.
//  RGB거리 DP

let n = Int(readLine()!)!
var rgbs = [[Int]]()

for _ in 0 ..< n {
    rgbs.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 1 ..< n {
    // Red
    rgbs[i][0] = rgbs[i][0] + min(rgbs[i-1][1], rgbs[i-1][2])
    // Green
    rgbs[i][1] = rgbs[i][1] + min(rgbs[i-1][0], rgbs[i-1][2])
    // Blue
    rgbs[i][2] = rgbs[i][2] + min(rgbs[i-1][0], rgbs[i-1][1])
}

print(min(rgbs[n-1][0], rgbs[n-1][1], rgbs[n-1][2]))
