//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/14.
//  Q1260 DFS-BFS

import Foundation

let nmv = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]

var graph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)

for _ in 0 ..< m {
    let a = readLine()!.split(separator: " ").map {Int(String($0))!}
    graph[a[0]].append(a[1])
    graph[a[1]].append(a[0])
}

for i in 0 ..< n+1 {
    graph[i].sort()
}

func dfs(_ graph: [[Int]],_ v: Int,_ visited: inout [Bool]) {
    
    visited[v] = true
    print(v, terminator: " ")

    
    for i in graph[v] {
        if !visited[i] {
            dfs(graph, i, &visited)
        }
        
    }
}

func bfs(_ graph: [[Int]],_ v: Int,_ visited: inout [Bool]) {
     
    var q = [Int]()
    visited[v] = true
    q.append(v)
    
    while !q.isEmpty {
        let now = q.removeFirst()
        print(now, terminator: " ")
        
        for i in graph[now] {
            if !visited[i] {
                q.append(i)
                visited[i] = true
            }
        }
    }
}

dfs(graph, v, &visited)
visited = Array(repeating: false, count: n+1)
print()
bfs(graph, v, &visited)
