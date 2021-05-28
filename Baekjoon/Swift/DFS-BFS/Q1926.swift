//
//  Q1926.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/28.
//  그림 / DFS-BFS


typealias Coord = (r: Int, c: Int)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var paper = [[String]]()
var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var len = 0
var maxVal = 0

for _ in 0 ..< n {
    paper.append(readLine()!.split(separator: " ").map { String($0) })
}

func solution(_ r: Int, _ c: Int) {
    let d: [Coord] = [(-1,0),(1,0),(0,-1),(0,1)]
    var q: [Coord] = [(r, c)]
    check[r][c] = true
    
    var cnt = 1
    var index = 0
    while index < q.count {
        let now = q[index]
        index += 1
        
        for i in 0 ..< 4 {
            let nr = now.r + d[i].r
            let nc = now.c + d[i].c
            
            if 0 <= nr && nr < n && 0 <= nc && nc < m {
                if paper[nr][nc] == "1" && check[nr][nc] == false {
                    q.append((nr, nc))
                    check[nr][nc] = true
                    cnt += 1
                }
            }
        }
    }
    maxVal = max(maxVal, cnt)
}

for r in 0 ..< n {
    for c in 0 ..< m {
        if paper[r][c] == "1" && check[r][c] == false {
            solution(r, c)
            len += 1
        }
    }
}

print(len)
print(maxVal)

