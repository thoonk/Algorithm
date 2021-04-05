//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/05.
//  피보나치 함수 DP

func countCall(_ n: Int) {
    guard n > 1 else { return }
    for i in 2..<n+1 {
        zero.append(zero[i-1] + zero[i-2])
        one.append(one[i-1] + one[i-2])
    }
}

let testCase = Int(readLine()!)!
var zero = [1,0]
var one = [0,1]

for _ in 0..<testCase {
    zero = [1,0]
    one = [0,1]
    let n = Int(readLine()!)!
    countCall(n)
    print(zero[n], one[n])
}

