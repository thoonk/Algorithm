//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/26.
//  체육복 (그리디)

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
    var attendStudents = Array(repeating: 1, count: n)
    
    for i in lost {
        attendStudents[i-1] -= 1
    }
    for i in reserve {
        attendStudents[i-1] += 1
    }
    
    for (i, v) in attendStudents.enumerated() {
        // 체육복이 없는 경우
        if v == 0{
            // 체육복 없는 학생의 전 학생이 체육복 여유가 있을 경우
            if i > 0 && attendStudents[i-1] == 2{
                attendStudents[i-1] -= 1
                attendStudents[i] += 1
            }
            // 체육복 있는 학생의 다음 학생이 체육복 여유가 있을 경우
            else if i < attendStudents.count - 1 && attendStudents[i+1] == 2{
                attendStudents[i+1] -= 1
                attendStudents[i] += 1
            }
        }
    }
    return attendStudents.filter { $0 > 0 }.count
}

print(solution(5, [2,4], [3]))
