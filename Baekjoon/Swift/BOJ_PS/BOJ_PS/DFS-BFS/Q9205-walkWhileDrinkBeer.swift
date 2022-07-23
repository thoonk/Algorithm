//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/23.
//  9205 맥주 마시면서 걸어가기

import Foundation

let testcase = Int(readLine()!)!

for _ in 0..<testcase {
    let cvs = Int(readLine()!)!
    var node = [[Int]]()
    var dist = [[Int]](repeating: [Int](), count: cvs+2)
    for _ in 0..<cvs+2 {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        node.append(input)
    }
    
    for i in 0..<cvs+2 {
        for j in 0..<cvs+2 {
            if i != j, isHappy(node[i], node[j]) {
                dist[i].append(j)
            }
        }
    }
    
    let result = bfs(cvs, dist)
    print(result[cvs+1] ? "happy" : "sad")
}

func bfs(_ cvs: Int, _ dist: [[Int]]) -> [Bool] {
    var visited = [Bool](repeating: false, count: cvs+2)
    var q = [Int]()
    var index = 0
    visited[0] = true
    q.append(0)
    
    while index<q.count {
        let now = q[index]
        index += 1
        
        for i in dist[now] {
            if !visited[i] {
                q.append(i)
                visited[i] = true
            }
        }
    }
    return visited
}

func isHappy(_ node1: [Int], _ node2: [Int]) -> Bool {
    let dist = abs(node1[0] - node2[0]) + abs(node1[1] - node2[1])
    return dist<=1000 ? true : false
}
