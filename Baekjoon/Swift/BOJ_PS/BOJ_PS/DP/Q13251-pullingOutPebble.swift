//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/30.
//  조약돌 꺼내기 조합

import Foundation

let m = Int(readLine()!)!
let rocks = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)!
let n = rocks.reduce(0,+)
var result: Double = 0

for i in 0 ..< m {
    var temp: Double = 1.0
    for j in 0 ..< k {
        temp *= Double(rocks[i]-j) / Double(n-j)
    }
    result += temp
}

print(String(format: "%.15f", result))
