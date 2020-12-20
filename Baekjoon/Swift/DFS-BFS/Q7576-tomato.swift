//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/20.
//  토마토 7576 BFS

import Foundation

let mn = readLine()!.split(separator: " ").map {Int(String($0))!}
let m = mn[0]
let n = mn[1]

var map = [[Int]]()
var result = 0
var q = [(Int,Int)]()
let d = [(0,-1),(0,1),(-1,0),(1,0)]
var zero = 0
var cnt = 0

for i in 0 ..< n {
    let row = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(row)
    for j in 0 ..< m {
        if map[i][j] == 1 {
            q.append((i,j))
        } else if map[i][j] == 0 {
            zero += 1
        }
    }
}

func bfs() {
    var idx = 0
    while q.count > idx {
        
        let (x,y) = q[idx]
        idx += 1
        
        
        for i in 0 ..< 4 {
            let nx = x + d[i].0
            let ny = y + d[i].1
            
            if 0<=nx, nx<n, 0<=ny, ny<m, map[nx][ny]==0 {
                q.append((nx,ny))
                map[nx][ny] = map[x][y]+1
                result = max(result, map[nx][ny])
                cnt += 1
            }
        }
    }
}

bfs()

if zero == 0 {
    print(zero)
} else {
    print(zero == cnt ? result-1 : -1)
}

