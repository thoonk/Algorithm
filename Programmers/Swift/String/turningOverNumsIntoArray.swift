//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/05.
//  자연수 뒤집어 배열로 만들기 Level1

import Foundation

func solution(_ n:Int64) -> [Int] {
    
    return Array(String(String(n).reversed())).map {Int(String($0))!}
}
print(solution(12345))
