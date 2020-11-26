//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/24.
//  H-Index (정렬)

import Foundation

var citations = [3, 0, 6, 1, 5]

func solution(_ citations:[Int]) -> Int {
    
    var hIndex = citations.max()!
    
    let citations = citations.sorted(by: >)
    
    while true {
        var cnt = 0

        for i in citations {
            if hIndex <= i {
                cnt += 1
            }
        }
        if cnt >= hIndex {
            return hIndex
        }
        hIndex -= 1
    }
}

print(solution(citations))
