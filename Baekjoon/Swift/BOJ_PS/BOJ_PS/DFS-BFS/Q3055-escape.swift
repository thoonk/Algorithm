//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/22.
//  탈출 BFS

typealias Coord = (r: Int, c: Int)

let d: [Coord] = [(0,1), (0,-1), (-1,0), (1,0)]
let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = rc[0]
let c = rc[1]

var forest = [[String]]()
var water = [Coord]()
var hedgehog = [Coord]()

solution()

func solution() {
    for i in 0 ..< r {
        forest.append(Array(readLine()!).map { String($0) })
        for j in 0 ..< c {
            if forest[i][j] == "S" {
                hedgehog.append((i,j))
            } else if forest[i][j] == "*" {
                water.append((i,j))
            }
        }
    }
    
    var result = 0
    while true {
        result += 1
        if hedgehog.count == 0 {
            print("KAKTUS")
            break
        }
        
        fillUp()
        if goToBeaver() == true {
            print(result)
            break
        }
    }
}

func fillUp() {
    for _ in 0 ..< water.count {
        let w = water.removeFirst()
        
        for i in 0 ..< 4 {
            let nr = w.r + d[i].r
            let nc = w.c + d[i].c
            
            if 0 <= nr && nr < r && 0 <= nc && nc < c {
                if forest[nr][nc] == "." {
                    forest[nr][nc] = "*"
                    water.append((nr, nc))
                }
            }
        }
    }
}

func goToBeaver() -> Bool {
    for _ in 0 ..< hedgehog.count {
        let h = hedgehog.removeFirst()
        
        for i in 0 ..< 4 {
            let nr = h.r + d[i].r
            let nc = h.c + d[i].c
            
            if 0 <= nr && nr < r && 0 <= nc && nc < c {
                if forest[nr][nc] == "D" {
                    return true
                }
                
                if forest[nr][nc] == "." {
                    forest[nr][nc] = "S"
                    hedgehog.append((nr, nc))
                }
            }
        }
    }
    return false
}

