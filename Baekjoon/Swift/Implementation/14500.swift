//
//  14500.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/02.
//  테트로미노 / 구현

typealias Coord = (r: Int, c: Int)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var paper = [[Int]]()
var check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

let d: [Coord] = [(-1,0),(0,-1),(1,0),(0,1)]
// ㅜ, ㅏ, ㅗ, ㅓ
let exD: [[Coord]] = [
    [(0,0),(0,1),(0,2),(1,1)],
    [(0,0),(1,0),(2,0),(1,1)],
    [(0,0),(0,1),(0,2),(-1,1)],
    [(0,0),(0,1),(-1,1),(1,1)]
]
var res = 0

// 'ㅜ'를 제외한 테트로미노 최댓값 구하기
func dfs(_ cnt: Int, _ sum: Int, _ r: Int, _ c: Int) {
    if cnt == 4 {
        res = max(res, sum)
        return
    }
    
    for i in 0 ..< 4 {
        let nr = r + d[i].r
        let nc = c + d[i].c
        
        guard 0 <= nr && nr < n && 0 <= nc && nc < m else { continue }
        
        if check[nr][nc] == false {
            check[nr][nc] = true
            dfs(cnt+1, sum+paper[nr][nc], nr, nc)
            check[nr][nc] = false
        }
    }
}

// 'ㅜ' 형태의 테트로미노 최댓값 구하기
func checkExcluded(_ r: Int, _ c: Int) {
    // ㅜ,ㅓ,ㅏ,ㅗ 네 가지 모두 구하기
    for i in 0 ..< 4 {
        var sum = 0
        var isComplete = true
        for j in 0 ..< 4 {
            let nr = r + exD[i][j].r
            let nc = c + exD[i][j].c
            
            // ㅗ,ㅓ,ㅏ,ㅗ 중 한 형태가 완성될 수 없을 때
            guard 0 <= nr && nr < n && 0 <= nc && nc < m else {
                isComplete = false
                break
            }
            sum += paper[nr][nc]
        }
        if isComplete == true {
            res = max(res, sum)
        }
    }
}

func solution() {
    for _ in 0 ..< n {
        paper.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    
    for r in 0 ..< n {
        for c in 0 ..< m {
            check[r][c] = true
            dfs(0, 0, r, c)
            check[r][c] = false
            
            checkExcluded(r, c)
        }
    }
    print(res)
}

solution()
