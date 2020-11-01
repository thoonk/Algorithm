//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/01.
//  미로 탈출 (BFS)

import Foundation

let matrix = readLine()!.split(separator: " ").map {Int($0)!}
let n = matrix[0]
let m = matrix[1]

var graph = [[Int]]()
for _ in stride(from: 0, to: n, by: 1){
    // 공백 없는 경우 [1, 2, 3, 4, 5]
    let row = Array(readLine()!).map {Int(String($0))!}
    graph.append(row)
}

// 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func bfs(_ x: Int, _ y: Int) -> Int{
    var queue = [[Int]]()
    queue.append([x, y])

    while !queue.isEmpty{
        let xy = queue.removeFirst()
        let x = xy[0]
        let y = xy[1]
        
        // 상하좌우 방문
        for i in stride(from: 0, to: 4, by: 1){
            let nx = x + dx[i]
            let ny = y + dy[i]
            // 범위 벗어나면 무시
            if nx < 0 || ny < 0 || nx >= n || ny >= m{
                continue
            }
            // 0이면 괴물이므로 무시
            if graph[nx][ny] == 0{
                continue
            }
            // 괴물 없는 칸 방문하여 최단 거리 기록
            if graph[nx][ny] == 1{
                graph[nx][ny] = graph[x][y] + 1
                
                if graph[x][y] == 1 {
                    graph[x][y] = 100001
                }
                queue.append([nx, ny])
            }
        }
    }
    // n, m 까지의 최단 거리 반환
    return graph[n - 1][m - 1]
}
print(bfs(0,0))
