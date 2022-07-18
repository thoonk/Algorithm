//
//  Q1965-puttingBox.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/19.
//  상자 넣기 / 다이나믹 프로그래밍

let n = Int(readLine()!)!

var box = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = [Int](repeating: 0, count: n)

for i in 1..<n {
    var temp = [Int]()
    for j in 0..<i {
        if box[j] < box[i] {
            temp.append(dp[j] + 1)
        }
    }
    
    if !temp.isEmpty,
       let maxValue = temp.max() {
        dp[i] = maxValue
    }
}

print(dp.max()! + 1)
