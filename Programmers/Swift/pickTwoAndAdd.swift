//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/18.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    let nums = numbers.sorted()
    var result = [Int]()
    
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if i==j {
                continue
            }
            let num = nums[i] + nums[j]
            if !result.contains(num) {
                result.append(num)
            }
        }
    }
    
    result.sort()
    
    return result
}

print(solution([2,1,3,4,1]))
