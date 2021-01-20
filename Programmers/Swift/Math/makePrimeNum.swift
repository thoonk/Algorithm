//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/21.
//  소수 만들기 Level2

import Foundation

func solution(_ nums:[Int]) -> Int {
    var cnt = 0
    
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                let sum = nums[i]+nums[j]+nums[k]
                if isPrime(sum) { cnt += 1 }
            }
        }
    }
    return cnt
}

func isPrime(_ num: Int) -> Bool {
    for i in 2..<num {
        if num%i == 0 {
            return false
        }
    }
    return true
}

print(solution([1,2,3,4]))
print(solution([1,2,3,4]))
