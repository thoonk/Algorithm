//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/18.
//  쿼드압축 후 개수 세기 Level2

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
    let result = buildQuad(arr)
    return [result.filter { $0 == 0 }.count, result.filter { $0 == 1 }.count]
}

func buildQuad(_ arr: [[Int]]) -> [Int] {
    
    let lenOfArr = arr.count
    var sumOfArr = 0
    
    arr.forEach {
        sumOfArr += $0.reduce(0,+)
    }

    if sumOfArr == lenOfArr * lenOfArr {
        return [1]
    } else if sumOfArr == 0 {
        return [0]
    }
    
    let (arr1, arr2, arr3, arr4) = (
        arr[0..<lenOfArr/2].map { Array($0[0..<lenOfArr/2]) },
        arr[0..<lenOfArr/2].map { Array($0[lenOfArr/2..<lenOfArr])},
        arr[lenOfArr/2..<lenOfArr].map { Array($0[0..<lenOfArr/2])},
        arr[lenOfArr/2..<lenOfArr].map { Array($0[lenOfArr/2..<lenOfArr])}
    )
    return buildQuad(arr1) + buildQuad(arr2) + buildQuad(arr3) + buildQuad(arr4)
}

print(solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]]))
print(solution([[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]]))
