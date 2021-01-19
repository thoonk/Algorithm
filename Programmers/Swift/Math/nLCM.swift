//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/19.
//  N개의 최소공배수

import Foundation

func solution(_ arr:[Int]) -> Int {
    var result = 1
    arr.forEach {
        result = result * $0 / getGCD(result, $0)
    }
    return result
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : getGCD(b, a%b)
}

print(solution([2,6,8,14]))
