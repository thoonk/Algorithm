//
//  Q4179.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/30.
//  불! / BFS

typealias Coord = (r: Int, c: Int)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var maze = [[String]]()
var jq = [Coord]()
var fq = [Coord]()
let d: [Coord] = [(-1,0),(0,-1),(1,0),(0,1)]

func spreadFire(_ next: inout [Coord]) {
    for i in 0 ..< fq.count {
        let now = fq[i]
        
        for j in 0 ..< 4 {
            let nr = now.r + d[j].r
            let nc = now.c + d[j].c
            
            if 0 <= nr && nr < n && 0 <= nc && nc < m {
                if maze[nr][nc] == "." {
                    maze[nr][nc] = "F"
                    next.append((nr,nc))
                }
            }
        }
    }
}

func moveJ(_ next: inout [Coord]) -> Bool {
    for i in 0 ..< jq.count {
        let now = jq[i]
        
        for j in 0 ..< 4 {
            let nr = now.r + d[j].r
            let nc = now.c + d[j].c
            
            if 0 <= nr && nr < n && 0 <= nc && nc < m {
                if maze[nr][nc] == "." {
                    maze[nr][nc] = "J"
                    next.append((nr,nc))
                }
            } else {
                return true
            }
        }
    }
    return false
}

func soluiton() {
    for i in 0 ..< n {
        maze.append(Array(readLine()!).map { String($0) })
        for j in 0 ..< m {
            if maze[i][j] == "J" {
                jq.append((i,j))
            } else if maze[i][j] == "F" {
                fq.append((i,j))
            }
        }
    }
    
    var res = 0
    while true {
        var nextJ = [Coord]()
        var nextF = [Coord]()

        if jq.isEmpty {
            print("IMPOSSIBLE")
            break
        }
        res += 1
        spreadFire(&nextF)
        if moveJ(&nextJ) == true {
            print(res)
            break
        }
        
        jq = nextJ
        fq = nextF
    }
}

soluiton()
