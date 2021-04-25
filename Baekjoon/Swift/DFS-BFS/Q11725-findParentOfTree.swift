//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/25.
//  트리의 부모 찾기 DFS

let n = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](), count: n+1)
var parents = [Int](repeating: 0, count: n+1)
var visited = [Bool](repeating: false, count: n+1)

for _ in 0 ..< n-1 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[0]].append(input[1])
    graph[input[1]].append(input[0])
}

findParent(1)
parents.forEach { if $0 != 0 { print($0) }}

func findParent(_ node: Int) {
    visited[node] = true
    
    for i in 0 ..< graph[node].count {
        let next = graph[node][i]
        
        if visited[next] == false {
            parents[next] = node
            findParent(next)
        }
    }
}

