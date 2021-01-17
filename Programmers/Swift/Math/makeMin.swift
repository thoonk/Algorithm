//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/17.
//  최솟값 만들기 Level2

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var A = A.sorted()
    var B = B.sorted(by: >)
    var ans = 0
    
    for i in 0..<A.count {
        ans += A[i] * B[i]
    }
    
    return ans
}

print(solution([1,4,2], [5,4,4]))
