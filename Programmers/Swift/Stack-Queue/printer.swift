//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/13.
//  프린터 큐 Level2

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var result = 0
    var list = [(Int, Int)]()
    var pList = priorities.sorted(by: >)
    
    for (i, priority) in priorities.enumerated() {
        list.append((i, priority))
    }

    while !list.isEmpty {
        let now = list.removeFirst()
        let maxP = pList.first
        
        if now.1 == maxP {
            result += 1
            pList.removeFirst()
            if now.0 == location {
                break
            }
        } else {
            list.append(now)
        }
    }
    
    return result
}
