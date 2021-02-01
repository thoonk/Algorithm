//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/02/01.
//  멀리 뛰기 Level3

import Foundation

func solution(_ n:Int) -> Int {
    
    var dp = [0,1,2]
    guard n>=3 else { return dp[n] }
        
    for _ in 2..<n {
        dp.append((dp[dp.count-2] + dp[dp.count-1])%1234567)
    }
    
    return dp[dp.count-1]
}

print(solution(4))
