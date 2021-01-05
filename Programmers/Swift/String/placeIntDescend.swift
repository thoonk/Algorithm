//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/05.
//  정수 내림차순으로 배치하기 Level1

import Foundation

func solution(_ n:Int64) -> Int64 {
    
    let temp = Array(String(n)).map {Int(String($0))!}.sorted(by: >)
    return Int64(temp.reduce("") { $0 + String($1) })!
}

print(solution(118372))
