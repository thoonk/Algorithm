//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/15.
//  다음 큰 숫자 Level2

import Foundation

func solution(_ n:Int) -> Int
{
    var next = n+1
    
    while true {
        if checkBinary(n) == checkBinary(next) {
            return next
        }
        next += 1
    }
}

func checkBinary(_ n: Int) -> Int {
    let s = String(n, radix: 2)
    return s.filter { $0 == "1"}.count
}
