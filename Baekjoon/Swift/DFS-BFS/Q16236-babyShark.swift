//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/23.
//  아기상어 BFS, 구현

typealias Coord = (r: Int, c: Int)
typealias Feed = (r: Int, c: Int, dist: Int)

let d = [(0,-1),(0,1),(-1,0),(1,0)]
let n = Int(readLine()!)!
var space = [[Int]]()
var feeds = [Feed]()
var dist = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var upgradeCnt = 0
var shark: Coord = (0,0)
var babySharkSize = 2
var result = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    space.append(input)
}

solution()

func bfs() {
    var q = [Coord]()
    q.append((shark.r, shark.c))
    dist = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    dist[shark.r][shark.c] = 1
    feeds = [Feed]()
    
    while !q.isEmpty {
        let now = q.removeFirst()
        for i in 0..<4 {
            let nr = now.r + d[i].0
            let nc = now.c + d[i].1
            
            if 0 <= nr && nr < n && 0 <= nc && nc < n && dist[nr][nc] == 0 {
                if space[nr][nc] != 0 && space[nr][nc] < babySharkSize {
                    dist[nr][nc] = dist[now.r][now.c] + 1
                    feeds.append((nr,nc,dist[nr][nc]))
                } else if space[nr][nc] == 0 || space[nr][nc] == babySharkSize {
                    dist[nr][nc] = dist[now.r][now.c] + 1
                    q.append((nr,nc))
                }
            }
        }
    }
}

func solution() {
    for r in 0..<n {
        for c in 0..<n {
            if space[r][c] == 9 {
                space[r][c] = 0
                shark.r = r
                shark.c = c
            }
        }
    }
    
    while true {
        bfs()
        if feeds.isEmpty {
            print(result)
            break
        } else {
            upgradeCnt += 1
            feeds = feeds.sorted {
                if $0.dist <= $1.dist {
                    return $0.r == $1.r ? $0.c < $1.c : $0.r < $1.r
                } else {
                    return false
                }
            }
            
            space[feeds[0].r][feeds[0].c] = 0
            result += dist[feeds[0].r][feeds[0].c]-1
            
            if babySharkSize == upgradeCnt {
                babySharkSize += 1
                upgradeCnt = 0
            }
            shark.r = feeds[0].r
            shark.c = feeds[0].c
        }
    }
}


