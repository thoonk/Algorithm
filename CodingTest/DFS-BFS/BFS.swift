//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/31.
//  BFS 예제

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

bfs(graph, 1, &visited)

func bfs(_ graph: [[Int]], _ start: Int, _ visited: inout [Bool]){
    
    var queue = [Int]()
    
    queue.append(start)
    visited[start] = true
    
    while !queue.isEmpty{
        
        let v: Int = queue.removeFirst()
        print(v, terminator: " ")
        
        for i in graph[v]{
            if visited[i] == false{
                queue.append(i)
                visited[i] = true
            }
        }
    }
}




