//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/17.
//  Q1987 알파벳 시간초과

import Foundation

let rc = readLine()!.split(separator: " ").map {Int(String($0))!}
let r = rc[0]
let c = rc[1]

var map = [[String]]()

for _ in 0 ..< r {
    map.append(Array(readLine()!).map { String($0) })
}

var check = Array(repeating: 0, count: 26)
var result = 0

check[Int(Character(map[0][0]).asciiValue!)-65] += 1


func dfs(_ x: Int, _ y: Int, _ cnt: Int) {
    
    result = max(result, cnt)

    let d = [(0,-1),(0,1),(-1,0),(1,0)]
    for i in 0 ..< 4 {
        let nx = x + d[i].0
        let ny = y + d[i].1
        
        if 0 <= nx, nx<r, 0<=ny, ny<c {
            let nAlpha = Int(Character(map[nx][ny]).asciiValue!)-65
            if check[nAlpha] == 0 {
                check[nAlpha] += 1
                dfs(nx, ny, cnt+1)
                check[nAlpha] -= 1
            }
        }
    }
}
dfs(0,0,1)
print(result)

