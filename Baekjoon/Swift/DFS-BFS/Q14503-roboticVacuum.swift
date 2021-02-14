//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/14.
//  14503 로봇청소기 DFS

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
let location = readLine()!.split(separator: " ").map { Int(String($0))! }
var area = [[Int]]()
var cnt = 0

for _ in 0..<n {
    area.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

dfs(location[0], location[1], location[2])

for i in 0..<n {
    print(area[i])
}
print(cnt)

func dfs(_ x: Int, _ y: Int, _ d: Int) {
    let direct = [(-1,0),(0,1),(1,0),(0,-1)]
    
    if area[x][y] == 0 {
        area[x][y] = 2
        cnt += 1
    }
    
    var d = d
    var nd = 0
    
    for _ in 0..<4 {
        // 현재 바라보는 방향에서 왼쪽 방향
        nd = (d+3)%4
        let nx = x + direct[nd].0
        let ny = y + direct[nd].1
        
        if 0<=nx, nx<n, 0<=ny, ny<m {
            if area[nx][ny] == 0 {
                // 다음 방향으로 이동
                dfs(nx,ny,nd)
                return
            }
        }
        d = nd
    }
    // 후진
    nd = (d+2)%4
    let nx = x + direct[nd].0
    let ny = y + direct[nd].1
    // 뒤쪽 방향이 벽이어서 후진할 수 없는 경우 종료
    if area[nx][ny] == 1 {
        return
    }
    dfs(nx,ny,d)
}
