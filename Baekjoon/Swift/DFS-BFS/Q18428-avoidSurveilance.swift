//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/06.
//  18428 감시 피하기 (DFS)

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var map = Array(repeating: Array(repeating: "X", count: n), count: n)
    
    for i in 0 ..< n {
        map[i] = readLine()!.split(separator: " ").map {String($0)}
    }
    // 장애물 세우기
    func buildObstacle(_ cnt: Int) {
        var cnt = cnt
        if cnt == 3 {
            for i in 0 ..< n {
                for j in 0 ..< n {
                    if map[i][j] == "T" {
                        if surveil(x: i, y: j) {
                            return
                        }
                    }
                }
            }
            print("YES")
            exit(0)
        }
        for i in 0 ..< n {
            for j in 0 ..< n {
                if map[i][j] == "X" {
                    map[i][j] = "O"
                    cnt += 1
                    buildObstacle(cnt)
                    map[i][j] = "X"
                    cnt -= 1
                }
            }
        }
    }
    // 선생님의 감시 성공 여부 판단
    func surveil(x: Int, y: Int) -> Bool {
        
        let d = [(0,-1), (0,1), (-1,0), (1,0)]
        
        for i in 0 ..< 4 {
            var nx = x + d[i].0
            var ny = y + d[i].1
            
            while 0 <= nx, nx < n, 0 <= ny, ny < n {
                if map[nx][ny] == "O" {
                    break
                }
                else if map[nx][ny] == "S" {
                    return true
                }
                nx += d[i].0
                ny += d[i].1
            }
        }
        return false
    }
    buildObstacle(0)
    print("NO")
    
}
solution()
