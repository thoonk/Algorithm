//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/29.
//  두 정수 사이의 합 Level1

import Foundation

func solution(_ a:Int, _ b:Int) -> Int64 {
    
    var result: Int64 = 0
    
    if a == b {
        return Int64(a)
    } else if a < b {
        for i in stride(from: a, through: b, by: 1) {
            result += Int64(i)
        }
    } else {
        for i in stride(from: b, through: a, by: 1) {
            result += Int64(i)
        }
    }
    return result
}
