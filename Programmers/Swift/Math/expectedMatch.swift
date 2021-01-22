//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/22.
//  예상 대진표 Level2

import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    var a = Double(a)
    var b = Double(b)
    
    while a != b {
        a = ceil(a/2)
        b = ceil(b/2)
        answer += 1
    }

    return answer
}

print(solution(8, 4, 7))
