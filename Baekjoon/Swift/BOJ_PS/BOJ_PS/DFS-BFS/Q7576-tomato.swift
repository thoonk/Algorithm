//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/20.
//  토마토 7576 BFS

typealias Coord = (r: Int, c: Int)

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = mn[0]
let n = mn[1]

var box = [[Int]]()
var q = [Coord]()
var ripen = 0
var zero = 0

func bfs() {
    let d: [Coord] = [(-1,0),(1,0),(0,-1),(0,1)]
    
    var index = 0
    while index < q.count {
        let now = q[index]
        index += 1
        
        for i in 0 ..< 4 {
            let nr = now.r + d[i].r
            let nc = now.c + d[i].c
            
            guard 0 <= nr && nr < n && 0 <= nc && nc < m else { continue }
            
            // 익지 않았다면 날짜 갱신 및 익은 토마토 개수 증가
            if box[nr][nc] == 0 {
                q.append((nr, nc))
                box[nr][nc] = box[now.r][now.c] + 1
                ripen += 1
            }
        }
    }
}

func solution() {
    for _ in 0 ..< n {
        box.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    for r in 0 ..< n {
        for c in 0 ..< m {
            if box[r][c] == 1 {
                q.append((r,c))
            } else if box[r][c] == 0 {
                zero += 1
            }
        }
    }

    bfs()
    // 모든 토마토가 익어 있는 상태
    if zero == 0 {
        print(0)
    }
    // 처음 익지 않은 상태와 익은 토마토의 개수가 같다면 익지 못하는 토마토가 없음
    else {
        print(zero == ripen ? box.flatMap({$0}).max()! - 1 : -1)
    }
}

solution()
