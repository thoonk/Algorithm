//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/21.
//  프린터 큐

import Foundation

typealias Docs = (index: Int, priority: Int)

let testCases = Int(readLine()!)!

for _ in 0..<testCases {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = nm[1]
    
    var cnt = 0
    var q = [Docs]()
    
    let docs = readLine()!.split(separator: " ").map { Int(String($0))! }
    var priorityDocs = docs.sorted(by: >)
    
    for (i,doc) in docs.enumerated() {
        q.append((i, doc))
    }
        
    while !q.isEmpty {
        let now = q.removeFirst()
        let maxPriority = priorityDocs.first
        
        if now.priority == maxPriority {
            cnt += 1
            priorityDocs.removeFirst()
            if now.index == m {
                print(cnt)
                break
            }
        } else {
            q.append(now)
        }
    }
}
