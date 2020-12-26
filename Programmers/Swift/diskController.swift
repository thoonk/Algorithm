//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/12/26.
//  디스크 컨트롤러

import Foundation

var jobs = [[0, 3], [1, 9], [2, 6]]

func solution(_ jobs:[[Int]]) -> Int {
    
    // 처리 시간이 빠른 순으로 정렬하고 처리 시간이 같은 경우 요청 시간으로 정렬
    var sortedJobs = jobs.sorted { (first, second) -> Bool in
        if first[1] < second[1] {
            return true
        } else if first[1] == second[1] {
            if first[0] < second[0] {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    var time = 0
    var sumTime = 0
    
    while !sortedJobs.isEmpty {
        for i in stride(from: 0, to: sortedJobs.count, by: 1) {
            if sortedJobs[i][0] <= time {
                time += sortedJobs[i][1]
                sumTime += time - sortedJobs[i][0]
                sortedJobs.remove(at:i)
                break
            }
            
            if i == sortedJobs.count - 1 {
                time += 1
            }
        }
    }
    return sumTime / jobs.count
}
print(solution(jobs))



