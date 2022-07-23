//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/22.
//  스타트링크 BFS

import Foundation

typealias Elevator = (floor: Int, count: Int)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let total = input[0]
let start = input[1]
let dest = input[2]
let up = input[3]
let down = input[4]

var visited = [Bool](repeating: false, count: total+1)

func bfs() -> Int {
    
    var q = [Elevator]()
    var index = 0
    q.append((start, 0))
    visited[start] = true
    
    while index < q.count {
        let now = q[index]
        index += 1
        
        if now.floor == dest {
            return now.count
        }
        
        let next = [now.floor+up, now.floor-down]
        
        for i in 0..<2 {
            if 1<=next[i], next[i]<=total, !visited[next[i]] {
                q.append((next[i], now.count+1))
                visited[next[i]] = true
            }
        }
    }
    return -1
}

let result = bfs()
print(result == -1 ? "use the stairs" : result)
