//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/23.
//

import Foundation

let mnk = readLine()!.split(separator: " ").map {Int(String($0))!}
let m = mnk[0]
let n = mnk[1]
let k = mnk[2]

var map = Array(repeating: Array(repeating: 0, count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)
var result = [Int]()

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    
    for i in stride(from: input[0], to: input[2], by: 1) {
        for j in stride(from: input[1], to: input[3], by: 1) {
            map[j][i] = 1
        }
    }
}

func bfs(_ x: Int, _ y: Int) -> Int {
    var q = [(Int,Int)]()
    let d = [(0,-1),(0,1),(-1,0),(1,0)]
    q.append((x,y))
    visited[x][y] = true
    var cnt = 1
    
    while !q.isEmpty {
        let (x, y) = q.removeFirst()
        for i in 0..<4 {
            let nx = x + d[i].0
            let ny = y + d[i].1
            
            if 0<=nx, nx<m, 0<=ny, ny<n {
                if !visited[nx][ny], map[nx][ny] == 0 {
                    visited[nx][ny] = true
                    q.append((nx,ny))
                    cnt += 1
                }
            }
        }
    }
    return cnt
}

print(map)

for i in 0..<m {
    for j in 0..<n {
        if map[i][j] == 0, !visited[i][j] {
            result.append(bfs(i,j))
        }
    }
}

result.sort()
print(result.count)
for i in result {
    print(i, terminator: " ")
}
