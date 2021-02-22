//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/21.
//  7569 토마토 BFS

import Foundation

typealias Tomato = (z: Int, x: Int, y: Int)

func solution() -> Int {

    let d = [(-1,0,0), (1,0,0), (0,-1,0), (0,1,0), (0,0,-1), (0,0,1)]
    
    let mnh = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = mnh[0]
    let n = mnh[1]
    let h = mnh[2]
    var boxes = [[[Int]]](repeating: [[Int]](repeating: [Int](), count: n), count: h)
    var result = 0
    
    for z in 0..<h {
        for x in 0..<n {
            let rows = readLine()!.split(separator: " ").map { Int(String($0))! }
            boxes[z][x].append(contentsOf: rows)
        }
    }
    
    var q = [Tomato]()
    
    func bfs() {
        var index = 0

        while index < q.count {
            let now = q[index]
            index += 1
            
            for i in 0..<6 {
                let nx = now.x+d[i].0
                let ny = now.y+d[i].1
                let nz = now.z+d[i].2
                
                if 0<=nx, nx<n, 0<=ny, ny<m, 0<=nz, nz<h {
                    if boxes[nz][nx][ny] == 0 {
                        q.append((nz,nx,ny))
                        boxes[nz][nx][ny] = boxes[now.z][now.x][now.y] + 1
                    }
                }
            }
        }
    }
    
    for z in 0..<h {
        for x in 0..<n {
            for y in 0..<m {
                if boxes[z][x][y] == 1 {
                    q.append((z,x,y))
                }
            }
        }
    }
    
    bfs()
    
    for z in 0..<h {
        for x in 0..<n {
            for y in 0..<m {
                if boxes[z][x][y] == 0 {
                    return -1
                }
                result = max(result, boxes[z][x][y])
            }
        }
    }
    return result == 1 ? 0 : result-1
}

print(solution())
