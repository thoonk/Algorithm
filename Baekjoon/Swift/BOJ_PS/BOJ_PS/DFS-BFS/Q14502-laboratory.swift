//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/12/01.
//  14502 연구소 (완전탐색, DFS)

typealias Coord = (r: Int, c: Int)

func buildWall(_ cnt: Int) {
    var cnt = cnt
    // 벽 3개를 다 세웠을 경우
    if cnt == 3 {
        for r in 0 ..< n {
            for c in 0 ..< m {
                copiedMap[r][c] = map[r][c]
            }
        }
        
        for r in 0 ..< n {
            for c in 0 ..< m {
                if copiedMap[r][c] == 2 {
                    spreadVirus((r,c))
                }
            }
        }
        var safeCnt = 0
        for r in 0 ..< n {
            for c in 0 ..< m {
                if copiedMap[r][c] == 0 {
                    safeCnt += 1
                }
            }
        }
        
        result = max(result, safeCnt)
        return
    }
    
    for r in 0 ..< n {
        for c in 0 ..< m {
            if map[r][c] == 0 {
                map[r][c] = 1
                cnt += 1
                buildWall(cnt)
                map[r][c] = 0
                cnt -= 1
            }
        }
    }
}

func spreadVirus(_ start: Coord) {
    let d: [Coord] = [(0,1),(0,-1),(1,0),(-1,0)]
    
    for i in 0 ..< 4 {
        let nr = start.r + d[i].r
        let nc = start.c + d[i].c
        
        if 0 <= nr, nr < n, 0 <= nc , nc < m {
            if copiedMap[nr][nc] == 0{
                copiedMap[nr][nc] = 2
                spreadVirus((nr, nc))
            }
        }
    }
}


let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nm[0]
let m = nm[1]

var map = [[Int]]()
var copiedMap = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var result = 0

for _ in 0 ..< n {
    map.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

buildWall(0)
print(result)

