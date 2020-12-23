//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/23.
//  1697 숨바꼭질 BFS

import Foundation

let nk = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nk[0]
let k = nk[1]

let size = 100001
var visited = Array(repeating: 0, count: size)

func bfs() -> Int {
    
    var q = [Int]()
    q.append(n)
    visited[n] = 1
    
    while !q.isEmpty {
        let x = q.removeFirst()
        
        if x == k {
            return visited[x]-1
        }
        
        if 0 <= x-1, visited[x-1]==0 {
            visited[x-1] = visited[x]+1
            q.append(x-1)
        }
        if x+1 < size, visited[x+1]==0 {
            visited[x+1] = visited[x]+1
            q.append(x+1)
        }
        if x*2 < size, visited[x*2]==0 {
            visited[x*2] = visited[x]+1
            q.append(x*2)
        }
    }
    return -1
}

print(bfs())
