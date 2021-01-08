//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/08.
//  비밀지도 카카오 Level1

import Foundation
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer = Array(repeating: "", count: n)
    
    for i in 0..<n {
        let sum = String(arr1[i]|arr2[i], radix: 2)
        
        for s in sum {
            answer[i] += s == "0" ? " " : "#"
        }
        if answer[i].count < n {
            for _ in 0..<n-answer[i].count {
                answer[i] = " " + answer[i]
            }
        }
    }
    return answer
}

print(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))
