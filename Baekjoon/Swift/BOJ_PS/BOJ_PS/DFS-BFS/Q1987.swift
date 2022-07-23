//
//  Q1987.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/07/02.
//  알파벳 / DFS (Swift로 풀었을 때 시간초과가 나서 비트마스크로 해결)

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = rc[0], c = rc[1]

var map = [[Int]]()
var maxAlpha = 0
var res = 0

func toAscii(_ c: Character) -> Int {
    Int(c.asciiValue!) - 65
}

func checkBorder(_ y: Int, _ x: Int) -> Bool {
    return 0..<r ~= y && 0..<c ~= x
}

func dfs(_ y: Int, _ x: Int, _ cnt: Int, _ b: Int) {
    
    res = max(res, cnt)
    guard res <= maxAlpha else { return }

    let d = [(0,-1),(0,1),(-1,0),(1,0)]
    for i in 0 ..< 4 {
        let ny = y + d[i].0
        let nx = x + d[i].1

        guard checkBorder(ny, nx) else {
            continue
        }
        let nb = 1 << map[ny][nx]
        // 비트마스크를 통해 값이 중복되는지 체크
        if b & nb == 0 {
            dfs(ny, nx, cnt+1, b | nb)
        }
    }
}

func solution() {
    for _ in 0 ..< r {
        let input: [Int] = Array(readLine()!).map { toAscii($0) }
        map.append(input)
        maxAlpha = max(maxAlpha, input.max()!)
    }
    map.forEach { print($0) }
    dfs(0,0,1,1 << map[0][0])
    print(res)
}
solution()
