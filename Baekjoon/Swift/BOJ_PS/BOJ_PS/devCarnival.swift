//
//  devCarnival.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/23.
//

//typealias Food = (index: Int, value: Int)
//
//let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = nk[0]
//let k = nk[1]
//
//var input = readLine()!.split(separator: " ").map { Int(String($0))! }
//var foods = [Food]()
//for i in 0 ..< n {
//    foods.append((i+1, input[i]))
//}
//
//foods.sort { $0.value == $1.value ? ($0.index%k) < ($1.index%k)  : $0.value < $1.value }
//
//print(foods)
//foods.forEach { print($0.index, terminator: " ")}

typealias Coord = (r: Int, c: Int)ㄴㅇㄹ
let d = [(-1,0),(1,0),(0,-1),(0,1)]

let n = Int(readLine()!)!
var board = [[String]]()

for _ in 0 ..< n {
    board.append(Array(readLine()!).map { String($0) })
}

var pos = readLine()!.split(separator: " ").map { Int(String($0))! }
var unit1: Coord = (pos[0], pos[1])
var unit2: Coord = (pos[2], pos[2])
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var cnt1 = 0
var cnt2 = 0

func toTarget(_ unit1: Coord, _ unit2: Coord) {
    visited[unit1.r][unit1.c] = true
    visited[unit2.r][unit2.c] = true
    
    var q = [(Coord, Coord)]()
    q.append((unit1, unit2))
    
    var index = 0
    while index < q.count {
        var now = q[index]
        index += 1
        
        for i in 0 ..< 4 {
            let nr1 = now.0.r + d[i].0
            let nr2 = now.1.r + d[i].0
            let nc1 = now.0.r + d[i].1
            let nc2 = now.1.r + d[i].1
            
            var new1 = (0,0)
            var new2 = (0,0)
            
            if now.0 != (-1, -1) {
                if 0 <= nr1, nr1 < n, 0 <= nc1, nc1 < n {
                    if visited[nr1][nc1] == false {
                        if board[nr1][nc1] == "." {
                            visited[nr1][nc1] == true
                            cnt1 += 1
                            new1 = (nr1, nc1)
                        } else if board[nr1][nc1] == "D" {
                            new1 = (-1, -1)
                        }
                    }
                }
            }
            
            if now.1 != (-1, -1) {
                if 0 <= nr2, nr2 < n, 0 <= nc2, nc2 < n {
                    if visited[nr2][nc2] == false {
                        if board[nr2][nc2] == "." {
                            visited[nr2][nc2] == true
                            cnt2 += 1
                            new2 = (nr1, nc1)
                        } else if board[nr2][nc2] == "D" {
                            new2 = (-1, -1)
                        }
                    }
                }
            }
        }
    }
}

toTarget(unit1, unit2)
print(cnt1, cnt2)
