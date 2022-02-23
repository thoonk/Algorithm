//
//  Q11403-FindPath.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/02/23.
//  경로 찾기 BFS

let n = Int(readLine()!)!
var graph = [[Int]]()
var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == 1 {
            result[i][j] = 1
            
            var q = [j]
            var visited = [j]
            
            var index = 0
            while index < q.count {
                let x = q[index]
                index += 1
                
                for k in 0..<n {
                    if graph[x][k] == 1 && !visited.contains(k) {
                        q.append(k)
                        visited.append(k)
                        result[i][k] = 1
                    }
                }
                
            }
        }
    }
}

for row in result {
    print(
        row.map { String($0) }
            .joined(separator: " ")
    )
}
