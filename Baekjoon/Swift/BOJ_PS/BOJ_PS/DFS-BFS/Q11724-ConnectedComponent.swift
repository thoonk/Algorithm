//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/25.
//  11724 연결요소의 개수 BFS

import Foundation

func solution() -> Int {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    
    var graph = [[Int]](repeating: [Int](), count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    var cnt = 0
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[input[0]].append(input[1])
        graph[input[1]].append(input[0])
    }
    
    for i in 1..<n+1 {
        if visited[i] == false {
            bfs(i, graph, &visited)
            cnt += 1
        }
    }
    
    return cnt
}

print(solution())

func bfs(_ start: Int, _ graph: [[Int]], _ visited: inout [Bool]) {
    var q = [Int]()
    var idx = 0
    
    q.append(start)
    visited[start] = true
    
    while idx<q.count {
        let now = q[idx]
        idx += 1
        
        for next in graph[now] {
            if visited[next] == false {
                q.append(next)
                visited[next] = true
            }
        }
    }
}
