//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/10.
//  2589 보물섬 BFS

typealias Coord = (r: Int, c: Int)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
var map = [[String]]()
var result = 0

func soltuion() -> Int {
    for _ in 0..<n {
        let temp = readLine()!
        map.append(Array(temp).map { String($0) })
    }
    
    for r in 0..<n {
        for c in 0..<m {
            if map[r][c] == "L" {
                let temp = bfs(r,c)
                result = max(result, temp)
            }
        }
    }
    
    return result
}

print(soltuion())

func bfs(_ r: Int, _ c: Int) -> Int {
    let d: [Coord] = [(-1,0),(1,0),(0,-1),(0,1)]
    var dist = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    dist[r][c] = 0
    var index = 0
    var temp = 0
    
    var q = [Coord]()
    q.append((r, c))
    
    while index<q.count {
        let now = q[index]
        index += 1

        for i in 0..<4 {
            let nr = now.r + d[i].r
            let nc = now.c + d[i].c
            
            if 0<=nr, nr<n, 0<=nc, nc<m {
                if dist[nr][nc] == -1, map[nr][nc] == "L" {
                    q.append((nr, nc))
                    dist[nr][nc] = dist[now.r][now.c]+1
                    temp = max(temp, dist[nr][nc])
                }
            }
        }
    }
    
    return temp
}
