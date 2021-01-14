//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/14.
//  피보나치 수 Level2

import Foundation

func solution(_ n:Int) -> Int {
    
    return fibo(n)
}

func fibo(_ n: Int) -> Int {
    
    var nums: [Int] = [0, 1]
    guard n >= 2 else { return n }
    
    (2...n).forEach {
        nums.append((nums[$0-1]+nums[$0-2])%1234567)
    }
    
    return nums[n]
}

print(solution(3))
