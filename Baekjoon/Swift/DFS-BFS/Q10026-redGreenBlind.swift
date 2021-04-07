//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/17.
//  Q10026 적록색약 DFS
import Foundation

let n = Int(readLine()!)!

var map = [[String]]()

for _ in 0..<n {
    map.append(Array(readLine()!).map {String($0)})
}
print(map)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

var cnt1 = 0
var cnt2 = 0
for i in 0 ..< n {
    for j in 0 ..< n {
        if !visited[i][j] {
            dfs(i,j)
            cnt1 += 1
        }
    }
}
visited = Array(repeating: Array(repeating: false, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == "G" {
            map[i][j] = "R"
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if !visited[i][j] {
            dfs(i,j)
            cnt2 += 1
        }
    }
}
print(cnt1, cnt2)

func dfs(_ x: Int, _ y: Int) {
    
    visited[x][y] = true
    
    let d = [(0,-1),(0,1),(-1,0),(1,0)]
    
    for i in 0..<4 {
        let nx = x + d[i].0
        let ny = y + d[i].1
        
        if 0<=nx, nx<n, 0<=ny, ny<n {
            if !visited[nx][ny], map[x][y] == map[nx][ny] {
                dfs(nx, ny)
            }
        }
    }
}
