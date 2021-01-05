//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/02.
//  소수 찾기 Level1

import Foundation

func solution(_ n:Int) -> Int {
    
    var isPrime = Array(repeating: false, count: n+1)
    
    func findPrime() {
        isPrime[0] = true
        isPrime[1] = true
        
        for i in 2...n {
            if !isPrime[i] {
                for j in stride(from: i*i, through: n, by: i) {
                    isPrime[j] = true
                }
            }
        }
    }
    findPrime()
    return isPrime.filter {$0 == false}.count
}

print(solution(10))
