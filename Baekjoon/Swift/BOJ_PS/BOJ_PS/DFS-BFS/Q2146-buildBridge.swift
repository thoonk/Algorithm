//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/01.
//  2146 다리만들기 DFS, BFS
typealias Coord = (r: Int, c: Int)

let n = Int(readLine()!)!
var map = [[Int]]()
var check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
let d: [Coord] = [(0,-1),(0,1),(-1,0),(1,0)]
var cnt = 1
var result = Int.max

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(input)
}

func solution() -> Int {
    
    for r in 0..<n {
        for c in 0..<n {
            if check[r][c] == false, map[r][c] == 1 {
                cnt += 1
                numberingIsland(r,c)
            }
        }
    }

    for i in 1..<cnt {
        buildBridge(i)
    }
    
    return result
}

print(solution())

/// 섬 번호 짓기
func numberingIsland(_ r: Int, _ c: Int) {
    check[r][c] = true
    map[r][c] = cnt
    
    for i in 0..<4 {
        let nr = r+d[i].r
        let nc = c+d[i].c
        
        if 0<=nr, nr<n, 0<=nc, nc<n {
            if check[nr][nc] == false, map[nr][nc] == 1 {
                numberingIsland(nr,nc)
            }
        }
    }
}

// 서로 다른 섬까지의 최단 거리 구하기
func buildBridge(_ islNum: Int) {
    var index = 0
    var q = [Coord]()
    var dist = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)

    for r in 0..<n {
        for c in 0..<n {
            if map[r][c] == islNum {
                dist[r][c] = 0
                q.append((r,c))
            }
        }
    }

    while index<q.count {
        let now = q[index]
        index += 1
        
        for i in 0..<4 {
            let nr = now.r + d[i].r
            let nc = now.c + d[i].c
            
            if 0<=nr, nr<n, 0<=nc, nc<n {
                // 다른 섬에 도착
                if map[nr][nc] > 0, map[nr][nc] != islNum {
                    result = min(result, dist[now.r][now.c])
                    return
                }
                // 바다
                if map[nr][nc] == 0, dist[nr][nc] == -1 {
                    dist[nr][nc] = dist[now.r][now.c]+1
                    q.append((nr,nc))
                }
            }
        }
    }
}
