//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/09.
//  예산 카카오 Level1

import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    let sortedD = d.sorted()
    var budget = budget
    var result = 0
    for i in sortedD {
        if budget < i {
            return result
        }
        budget -= i
        result += 1
    }
    
    return result
}

print(solution([1,3,2,5,4],9))
