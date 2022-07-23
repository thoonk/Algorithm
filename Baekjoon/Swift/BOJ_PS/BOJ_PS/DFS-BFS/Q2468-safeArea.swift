//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/15.
//  Q2468 안전영역

import Foundation

let n = Int(readLine()!)!

var region = [[Int]]()
var minHeight = Int.max
var maxHeight = 0

for _ in 0 ..< n {
    let row = readLine()!.split(separator: " ").map {Int(String($0))!}
    region.append(row)
    minHeight = min(minHeight, row.min()!)
    maxHeight = max(maxHeight, row.max()!)
}
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
// 아무 지역도 물에 안 잠기는 경우의 수 가 있음
var result = 1

for h in minHeight ..< maxHeight {
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var cnt = 0
    for i in 0 ..< n {
        for j in 0 ..< n {
            if !visited[i][j], region[i][j] > h {
                cnt += 1
                dfs(i, j, h)
            }
        }
    }
    result = max(result, cnt)
}

print(result)

func dfs(_ x: Int, _ y: Int, _ h: Int) {
    
    visited[x][y] = true
    
    let d = [(0,-1),(0,1),(-1,0),(1,0)]
    
    for i in 0 ..< 4 {
        let nx = x+d[i].0
        let ny = y+d[i].1
        
        if 0 <= nx, nx < n, 0 <= ny, ny < n {
            if !visited[nx][ny], region[nx][ny] > h {
                dfs(nx, ny, h)
            }
        }
    }
}
