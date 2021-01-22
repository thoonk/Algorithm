//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/22.
//  점프와 순간이동 Level2

import Foundation

func solution1(_ n:Int) -> Int
{
    return n.nonzeroBitCount
}

func solution2(_ n:Int) -> Int
{
    var n = n
    var cnt = 0
    
    while n>0 {
        if n%2 == 1 {
            cnt += 1
        }
        n /= 2
    }

    return cnt
}
print(solution1(5000))
print(solution2(5000))
