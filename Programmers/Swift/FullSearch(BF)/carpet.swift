//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/25.
//  카펫 (완전 탐색)

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var result = [Int]()
    
    let total = brown + yellow
    var row = 0
    var col = 0
    
    for i in stride(from: 1, through: total, by: 1) {
        // 약수 구하기
        if total % i == 0{
            row = total / i
            col = i
        }
        // 규칙을 이용해서 row, col 구하기
        if (row - 2) * (col - 2) == yellow {
            result.append(row)
            result.append(col)
            break
        }
    }
    return result
}

print(solution(24, 24))
