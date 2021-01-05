//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/06.
//  최대공약수와 최소공배수 Level1

import Foundation

func solution(_ n:Int, _ m:Int) -> [Int] {
    
    func getGCD(_ n: Int, _ m: Int) -> Int {
        return m == 0 ? n : getGCD(m, n%m)
    }
    func getLVM(_ n: Int, _ m: Int) -> Int {
        return n * m / getGCD(n, m)
    }
    
    return [getGCD(n, m), getLVM(n, m)]
}

print(solution(3, 12))
