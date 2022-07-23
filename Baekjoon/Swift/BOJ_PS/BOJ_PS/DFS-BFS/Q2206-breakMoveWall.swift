//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/20.
//  Q2206 벽 부수고 이동하기

import Foundation

let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nm[0]
let m = nm[1]

var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: m), count: n)
var result = 0

for _ in 0 ..< n {
    map.append(Array(readLine()!).map {Int(String($0))!})
}

func bfs() -> Int {
    
    var q = [((Int, Int),Int)]()
    let d = [(0,-1),(0,1),(-1,0),(1,0)]
    q.append(((0,0),1))
    visited[0][0][1] = 1
    
    var idx = 0

    while q.count > idx { 
        let ((x,y),z) = q[idx]
        idx += 1
        if x == n-1, y == m-1 {
            return visited[x][y][z]
        }
        
        for i in 0..<4 {
            let nx = x + d[i].0
            let ny = y + d[i].1
            if 0<=nx, nx<n, 0<=ny, ny<m {
                // 벽
                if map[nx][ny]==1, z==1 {
                    visited[nx][ny][z-1] = visited[x][y][z]+1
                    q.append(((nx,ny),z-1))
                } else if map[nx][ny]==0, visited[nx][ny][z]==0 {
                    visited[nx][ny][z] = visited[x][y][z]+1
                    q.append(((nx,ny),z))
                }
            }
        }
    }
    return -1
}

print(bfs())
