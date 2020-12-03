//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/12/02.
//  Q3190 뱀 (구현)

import Foundation

func solution() {
    
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var map = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var turnInfo = [(Int, String)]()
    
    for _ in 0 ..< k {
        let apple = readLine()!.split(separator: " ").map {Int(String($0))!}
        map[apple[0]][apple[1]] = 1
    }
    
    let l = Int(readLine()!)!
    
    for _ in 0 ..< l {
        let xc = readLine()!.split(separator: " ")
        turnInfo.append((Int(xc[0])!, String(xc[1])))
    }
    // 동, 남, 서, 북
    let dx = [0,1,0,-1]
    let dy = [1,0,-1,0]
    
    
    func turn(_ direction: Int, _ str: String) -> Int {
        var d = direction
        d += str == "L" ? -1 : 1
        if d == 4 { d = 0 }
        else if d < 0 { d = 3 }
        return d
    }
    
    func simulate() -> Int{
        var x = 1
        var y = 1
        map[x][y] = 2
        var direction = 0
        var time = 0
        var idx = 0
        
        var snake = [(x,y)]
        while true {
            let nx = x + dx[direction]
            let ny = y + dy[direction]
            
            if 1 <= nx, nx <= n, 1 <= ny, ny <= n, map[nx][ny] != 2 {
                if map[nx][ny] == 0 {
                    map[nx][ny] = 2
                    snake.append((nx, ny))
                    let passed = snake.removeFirst()
                    map[passed.0][passed.1] = 0
                }
                
                if map[nx][ny] == 1 {
                    map[nx][ny] = 2
                    snake.append((nx, ny))
                }
            } else {
                time += 1
                break
            }
            x = nx
            y = ny
            time += 1
            
            if idx < l, turnInfo[idx].0 == time {
                direction = turn(direction, turnInfo[idx].1)
                idx += 1
            }
        }
        return time
    }
    
    print(simulate())
}
solution()
