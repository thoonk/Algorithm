//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/31.
//  음료수 얼려 먹기 (DFS)

import Foundation

//
let place = readLine()!.split(separator: " ").map {Int($0)!}
let n = place[0]
let m = place[1]

var graph = [[Int]]()
for _ in stride(from: 0, to: n, by: 1){
    // 공백 없는 경우 [1, 2, 3, 4, 5]
    let row = Array(readLine()!).map {Int(String($0))!}
    graph.append(row)
}

var cnt = 0

func dfs(_ x: Int, _ y: Int) -> Bool {
    
    // 범위 벗어나면 끝
    if x <= -1 || x >= n || y <= -1 || y >= m {
        return false
    }
    
    // 현재 노드가 0이라면 방문
    if graph[x][y] == 0 {
        // 방문 체크
        graph[x][y] = 1
        
        dfs(x-1, y) // 상
        dfs(x+1, y) // 하
        dfs(x, y-1) // 좌
        dfs(x, y+1) // 우
        
        return true
    }
    return false
}

// 모든 노드에 대해서 방문
for i in stride(from: 0, to: n, by: 1){
    for j in stride(from: 0, to: m, by: 1){
        if dfs(i, j) == true{
            cnt += 1
        }
    }
}
print(cnt)
