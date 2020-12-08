//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/11/29.
//  실패율 카카오 2019

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var cnt = Array(repeating: 0, count: N+1)
    
    for stage in stages{
        cnt[stage-1] += 1
    }
    
    var userNum = stages.count
    var result = [(Int, Double)]()
    
    for i in 0 ..< cnt.count-1 {
        // 실패율이 0인 경우
        if cnt[i] == 0 {
            result.append((i,0))
        } else { // 실패율 계산
            result.append((i, Double(cnt[i])/Double(userNum)))
            userNum -= cnt[i]
        }
    }
    // 실패율 내림차순 정렬
    result.sort(by: { $0.1 > $1.1 })
    
    return result.map{ $0.0+1 }
}
print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
