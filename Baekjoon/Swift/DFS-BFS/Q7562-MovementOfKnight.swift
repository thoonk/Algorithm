//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/20.
//  나이트의 이동 BFS

typealias Coord = (r: Int, c: Int)

func bfs(_ start: [Int], _ target: [Int], _ n: Int, _ graph: inout [[Int]]) {
    let d = [(-1,-2),(1,-2),(-1,2),(1,2),(-2,-1),(-2,1),(2,-1),(2,1)]
    var q = [Coord]()
    q.append((start[0], start[1]))
    var index = 0
    while index < q.count {
        let now = q[index]
        index += 1
        
        if now.r == target[0] && now.c == target[1] {
            print(graph[now.r][now.c] - 1)
            return
        }
        
        for i in 0 ..< 8 {
            let nr = now.r + d[i].0
            let nc = now.c + d[i].1
            
            if 0 <= nr && nr < n && 0 <= nc && nc < n {
                if graph[nr][nc] == 0 {
                    graph[nr][nc] = graph[now.r][now.c] + 1
                    q.append((nr, nc))
                }
            }
        }
    }
}

func solution() {
    for _ in 0 ..< t {
        let n = Int(readLine()!)!
        let knight = readLine()!.split(separator: " ").map { Int(String($0))! }
        let target = readLine()!.split(separator: " ").map { Int(String($0))! }
        var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        graph[knight[0]][knight[1]] = 1
        bfs(knight, target, n, &graph)
    }
}

let t = Int(readLine()!)!
solution()
