//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/01.
//  3진법 뒤집기 Level1

import Foundation

import Foundation

func solution(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}

print(solution(45))
