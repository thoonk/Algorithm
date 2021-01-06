//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/06.
//  하샤드 수 Level1

import Foundation

func solution(_ x:Int) -> Bool {
    
    let posSum = Array(String(x)).map {Int(String($0))!}.reduce(0,+)
    
    return x%posSum == 0 ? true : false
}

print(solution(10))
