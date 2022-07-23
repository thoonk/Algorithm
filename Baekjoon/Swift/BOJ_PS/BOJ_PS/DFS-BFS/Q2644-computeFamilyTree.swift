//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/21.
//  촌수계산 BFS

import Foundation

func solution() -> Int {
    
    let n = Int(readLine()!)!
    let target = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = Int(readLine()!)!
    var familyTree = [[Int]](repeating: [Int](), count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    
    for _ in 0..<m {
        let relation = readLine()!.split(separator: " ").map { Int(String($0))! }
        familyTree[relation[0]].append(relation[1])
        familyTree[relation[1]].append(relation[0])
    }
    
    var q = [(Int, Int)]()
    var index = 0
    let start = target[0]
    q.append((start, 0))
    visited[start] = true
    
    while index < q.count {
        let now = q[index]
        index += 1
        
        if now.0 == target[1] {
            return now.1
        } else {
            for next in familyTree[now.0] {
                if visited[next] == false {
                    let cnt = now.1 + 1
                    q.append((next,cnt))
                    visited[next] = true
                }
            }
        }
    }
    return -1
}

print(solution())
