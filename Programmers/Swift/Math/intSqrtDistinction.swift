//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/05.
//  정수 제곱근 판별 Level1

import Foundation

func solution(_ n:Int64) -> Int64 {
    
    return sqrt(Double(n)).truncatingRemainder(dividingBy: 1) != 0 ? -1 : Int64(pow(sqrt(Double(n))+1, 2.0))
}
print(solution(121))
