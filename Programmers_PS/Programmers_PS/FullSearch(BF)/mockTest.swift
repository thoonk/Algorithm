//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/24.
//  모의고사 (완전 탐색)

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    let answer1 = [1, 2, 3, 4, 5]
    let answer2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let answer3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var scores = [Int:Int]()
    
    for i in stride(from: 0, to: answers.count, by: 1){
        if answer1[i%answer1.count] == answers[i] {scores[1] = (scores[1] ?? 0) + 1}
        if answer2[i%answer2.count] == answers[i] {scores[2] = (scores[2] ?? 0) + 1}
        if answer3[i%answer3.count] == answers[i] {scores[3] = (scores[3] ?? 0) + 1}
    }
    
    let result = scores.filter { $0.value == scores.values.max() }.keys.sorted()

    return result
}

print(solution([1,2,3,4,5]))
