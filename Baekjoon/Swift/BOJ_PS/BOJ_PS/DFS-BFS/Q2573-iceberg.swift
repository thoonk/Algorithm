//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/23.
//  2573 빙산 DFS+BFS

import Foundation

typealias Coord = (r: Int, c: Int)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var earth = [[Int]](repeating: [Int](), count: n)
let d = [(-1,0),(1,0),(0,-1),(0,1)]

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    earth[i].append(contentsOf: input)
}

var result = 0
var temp = 0

while true {
    temp = countSeparated()
    
    if temp == 0 {
        result = 0
        break
    } else if temp >= 2 {
        break
    }
    
    bfs()
    result += 1
}

print(result)

/// 빙하 녹이기
func bfs() {
    var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var q = [Coord]()
    var index = 0

    for r in 0..<n {
        for c in 0..<m {
            if earth[r][c] > 0 {
                q.append((r,c))
                check[r][c] = true
            }
        }
    }
    
    while index<q.count {
        let now = q[index]
        index += 1
        // 0의 개수
        var cnt = 0
        
        for i in 0..<4 {
            let nr = now.r+d[i].0
            let nc = now.c+d[i].1
            
            if 0<=nr, nr<n, 0<=nc, nc<m {
                if !check[nr][nc], earth[nr][nc] == 0 {
                    cnt += 1
                }
            }
        }
        
        if earth[now.r][now.c] < cnt {
            earth[now.r][now.c] = 0
        } else {
            earth[now.r][now.c] -= cnt
        }
    }
}

/// 분리되어 있는지 확인
func countSeparated() -> Int {
    var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var cnt = 0
    
    for r in 0..<n {
        for c in 0..<m {
            if !check[r][c], earth[r][c] > 0 {
                cnt += 1
                dfs(r,c,&check)
            }
        }
    }
    return cnt
}

/// 동서남북으로 방문하면서 모두 0인지 확인
func dfs(_ r: Int, _ c: Int, _ check: inout [[Bool]]) {
    check[r][c] = true
    
    for i in 0..<4 {
        let nr = r+d[i].0
        let nc = c+d[i].1
        
        if 0<=nr, nr<n, 0<=nc, nc<m {
            if !check[nr][nc], earth[nr][nc] > 0 {
                dfs(nr, nc, &check)
            }
        }
    }
}

