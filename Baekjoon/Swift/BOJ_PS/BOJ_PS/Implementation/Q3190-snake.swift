//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/20.
//  뱀 구현

typealias Coord = (r: Int, c: Int)

func turn(_ d: inout Int, _ cmd: String) {
    d += cmd == "L" ? -1 : 1
    if d == 4 { d = 0 }
    else if d < 0 { d = 3 }
}

func simulate() {
    var r = 1
    var c = 1
    board[r][c] = 2
    var direction = 0
    var time = 0
    var index = 0
    
    var snake: [Coord] = [(r,c)]
    while true {
        let nr = r + d[direction].0
        let nc = c + d[direction].1
        
        if 1 <= nr && nr <= n && 1 <= nc && nc <= n && board[nr][nc] != 2 {
            if board[nr][nc] == 0 {
                board[nr][nc] = 2
                snake.append((nr, nc))
                let passed = snake.removeFirst()
                board[passed.r][passed.c] = 0
            }
            
            if board[nr][nc] == 1 {
                board[nr][nc] = 2
                snake.append((nr, nc))
            }
        } else {
            time += 1
            break
        }
        
        r = nr
        c = nc
        time += 1
        
        if index < l && Int(turnInfo[index][0]) == time {
            turn(&direction, turnInfo[index][1])
            index += 1
        }
    }
    print(time)
}

let d = [(0,1), (1,0), (0,-1), (-1,0)]
let n = Int(readLine()!)!
let k = Int(readLine()!)!
var board = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
var turnInfo = [[String]]()

for _ in 0 ..< k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    board[input[0]][input[1]] = 1
}
let l = Int(readLine()!)!
for _ in 0 ..< l {
    turnInfo.append(readLine()!.split(separator: " ").map { String($0) })
}
simulate()

