//
//  Q1934-leastCommonMultiple.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/31.
//  최소공배수 / 수학

func getGCD(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : getGCD(b, a % b)
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    return a * b / getGCD(a, b)
}

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    print(getLCM(input[0], input[1]))
}
