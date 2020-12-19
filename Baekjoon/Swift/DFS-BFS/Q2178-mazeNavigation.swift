//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/18.
//  Q2178 미로 탐색

import Foundation

let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nm[0]
let m = nm[1]

var maze = [[Int]]()
var visited = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0 ..< n {
    maze.append(Array(readLine()!).map {Int(String($0))!})
}

func bfs(_ x: Int, _ y: Int) {

    var q = [(Int,Int)]()
    let d = [(0,-1),(0,1),(-1,0),(1,0)]
    visited[x][y] = 1
    q.append((x,y))
    
    while !q.isEmpty {
        
        let now = q.removeFirst()
        
        for i in 0 ..< 4 {
            let nx = now.0+d[i].0
            let ny = now.1+d[i].1
            
            if 0<=nx, nx<n, 0<=ny, ny<m {
                if visited[nx][ny]==0, maze[nx][ny]==1 {
                    visited[nx][ny] = visited[now.0][now.1]+1
                    q.append((nx,ny))
                }
            }
        }
    }
}

bfs(0, 0)
print(visited[n-1][m-1])


