//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/18.
//  행렬의 곱셈 Level2

import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = [[Int]]()
    
    for i in 0..<arr1.count {
        result.append([])
        for y in 0..<arr2[0].count {
            var temp = 0
            for x in 0..<arr2.count {
                temp += arr1[i][x] * arr2[x][y]
            }
            result[i].append(temp)
        }
    }
    return result
}

print(solution([[1, 4], [3, 2], [4, 1]], [[3,3],[3,3]]))
print(solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]]))
