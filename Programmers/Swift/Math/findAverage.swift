//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/06.
//  평균 구하기 Level1

import Foundation

func solution(_ arr:[Int]) -> Double {
    
    return Double(arr.reduce(0,+))/Double(arr.count)
}

print(solution([1,2,3,4]))
