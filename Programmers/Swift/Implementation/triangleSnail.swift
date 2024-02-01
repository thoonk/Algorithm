//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/13.
//  삼각달팽이 Level2 

import Foundation

func solution(_ n:Int) -> [Int] {
    let d = [(1,0), (0,1), (-1,-1)]
    var direct = 0
    var row = 0, col = 0
    var num = 1
    var result = [[Int]]()
    
    (1...n).forEach {
        result.append([Int](repeating: 0, count: $0))
    }
    
    (1...n).reversed().forEach {
        print($0)
        (0..<$0-1).forEach { _ in
            result[row][col] = num
            row += d[direct].0
            col += d[direct].1
            num += 1
        }
        result[row][col] = num
        num += 1
        direct = (direct+1)%3
        row += d[direct].0
        col += d[direct].1
    }
    
    return result.reduce(into: [Int]()) { $0.append(contentsOf: $1)}
}

import Foundation

func solution2(_ n:Int) -> [Int] {
    let d = [(1,0), (0,1), (-1,-1)]
    var direct = 0
    var r = 0, c = 0
    var num = 1
    var result = [[Int]]()
    let sum = (n+1) * n / 2
    
    (1...n).forEach {
        result.append([Int](repeating: 0, count: $0))
    }
    
    while num <= sum {
        result[r][c] = num
        let nr = r + d[direct].0
        let nc = c + d[direct].1
        
        if 0 <= nr, nr < n, 0 <= nc, nc <= nr, result[nr][nc] == 0 {
            r = nr
            c = nc
        } else {
            direct = (direct+1) % 3
            r += d[direct].0
            c += d[direct].1
        }
        
        num += 1
    }
    
    return result.flatMap { $0 }
}

print(solution2(4))
