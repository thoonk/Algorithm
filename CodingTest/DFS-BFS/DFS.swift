//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/31.
//  DFS 예제 (재귀)

import Foundation

let graph = [ [],
             [2,3,8],
             [1,7],
             [1,4,5],
             [3,5],
             [3,4],
             [7],
             [2,6,8],
             [1,7] ]

var visited = Array(repeating: false, count: 9)

dfs(graph, 1, &visited)

func dfs(_ graph: [[Int]], _ v: Int, _ visited: inout [Bool]) {
    
    visited[v] = true
    print(v, terminator: " ")
    
    for i in graph[v]{
        if visited[i] == false{
            dfs(graph, i, &visited)
        }
    }
}
