//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/06.
//  유기농 배추 DFS

typealias Coord = (r: Int, c: Int)

func dfs(_ cabbage: Coord, _ field: [[Int]], _ check: inout [[Bool]], _ n: Int, _ m: Int) {
    let d: [Coord] = [(-1,0), (1,0), (0,-1), (0,1)]
    check[cabbage.r][cabbage.c] = true
    
    for i in 0 ..< 4 {
        let nr = cabbage.r + d[i].r
        let nc = cabbage.c + d[i].c
        
        if 0 <= nr && nr < n && 0 <= nc && nc < m {
            if check[nr][nc] == false && field[nr][nc] == 1 {
                dfs((nr, nc), field, &check, n, m)
            }
        }
    }
}

let testCase = Int(readLine()!)!

for _ in 0 ..< testCase {
    let mnk = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = mnk[0]
    let n = mnk[1]
    let k = mnk[2]
    
    var field = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var cnt = 0

    for _ in 0 ..< k {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        field[input[1]][input[0]] = 1
    }
    
    for r in 0 ..< n {
        for c in 0 ..< m {
            if field[r][c] == 1 && check[r][c] == false {
                dfs((r,c), field, &check, n, m)
                cnt += 1
            }
        }
    }
    print(cnt)
}


