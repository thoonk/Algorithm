//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/05.
//  자릿수 더하기 Level1  

import Foundation

func solution(_ n:Int) -> Int
{
    return Array(String(n)).map{Int(String($0))!}.reduce(0,+)
}

print(solution(987))
