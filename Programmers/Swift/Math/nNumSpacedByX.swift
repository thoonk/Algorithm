//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/08.
//  x만큼 간격이 있는 n개의 숫자 Level1

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    
    var result = [Int64]()
    if x == 0 {
        return Array(repeating: 0, count: n)
    }
    for i in stride(from: x, through: x*n, by: x) {
        result.append(Int64(i))
    }
    
    return result
}

print(solution(0, 3))
