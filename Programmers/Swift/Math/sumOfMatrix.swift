//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/07.
//  행렬의 덧셈 Level1

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var result = arr1
    
    for i in 0..<arr1.count {
        for j in 0..<arr1[0].count {
            result[i][j] += arr2[i][j]
        }
    }
    return result
}

print(solution([[1,2],[2,3]], [[3,4],[5,6]]))
