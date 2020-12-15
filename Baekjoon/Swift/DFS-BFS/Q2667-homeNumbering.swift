//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/15.
//  Q2667 단지번호붙이기 DFS

import Foundation

let n = Int(readLine()!)!
var map = [[Int]]()

for _ in 0 ..< n {
    let row = Array(readLine()!).map {Int(String($0))!}
    map.append(row)
}

let d = [(0,-1),(0,1),(-1,0),(1,0)]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = [Int]()
var cnt = 0

for i in 0 ..< n {
    for j in 0 ..< n {
        if map[i][j] == 1, !visited[i][j] {
            cnt = 0
            dfs(i, j)
            result.append(cnt)
        }
    }
}

let resultCnt = result.count
print(resultCnt)
result.sort()
for i in result {
    print(i)
}

func dfs(_ x: Int,_ y: Int) {
        
    visited[x][y] = true
    cnt += 1
    
    for i in 0 ..< 4 {
        let nx = x + d[i].0
        let ny = y + d[i].1
        
        if 0 <= nx, nx < n, 0 <= ny, ny < n {
            if map[nx][ny] == 1, !visited[nx][ny] {
                dfs(nx, ny)
            }
        }
    }
}
/*
7
0110100
0110101
1110101
0000111
0100000
0111110
0111000
*/
