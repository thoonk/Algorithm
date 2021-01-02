//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/02.
//  서울에서 김서방 찾기 Level1

import Foundation

func solution(_ seoul:[String]) -> String {
    
    var idx = 0
    
    for i in 0..<seoul.count {
        if seoul[i] == "Kim" {
            idx = i
        }
    }
        
    return "김서방은 \(idx)에 있다"
}

print(solution(["Jane", "Kim"]))
