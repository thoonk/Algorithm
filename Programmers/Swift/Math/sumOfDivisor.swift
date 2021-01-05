//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/04.
//  약수의 합 Level1

import Foundation

func solution(_ n:Int) -> Int {
    
    var result = Set<Int>()
    
    if n == 0 {
        return 0
    } else {
        for i in 1...n {
            if n%i == 0 {
                result.insert(i)
            }
        }
    }
    return result.reduce(0,+)
}

print(solution(12))
