//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/21.
//  기능 개발 (스택/큐)

import Foundation

//var progresses = [93, 30, 55]
var progresses = [95, 90, 99, 99, 80, 99]
//var speeds = [1, 30, 5]
var speeds = [1,1,1,1,1,1]

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let len = progresses.count
    var result = [Int]()
    var day = Array(repeating: 0, count: len)
    var temp = 0
    var num = 0
    
    for i in stride(from: 0, to: len, by: 1){
        temp = progresses[i]
        while true{
            temp += speeds[i]
            day[i] += 1
            if temp >= 100 {
                break
            }
        }
    }
    
    while !day.isEmpty {
        var cnt = 0
        num = day.removeFirst()
        cnt += 1
        while !day.isEmpty && num >= day.first! {
            cnt += 1
            day.removeFirst()
        }
        result.append(cnt)
    }
    
    return result
}

print(solution(progresses, speeds))
