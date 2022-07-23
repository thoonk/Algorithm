//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/20.
//  럭키스트라이크 구현

let n = Array(readLine()!).map { Int(String($0))! }
let mid = n.count / 2
var midSum = 0
for i in 0 ..< mid {
    midSum += n[i]
}

if n.reduce(0, +) == midSum * 2 {
    print("LUCKY")
} else {
    print("READY")
}
