//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/05.
//  네트워크 연결 / 최소스패닝트리

typealias Edge = (a: Int, b: Int, c: Int)

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var parent = [Int](repeating: 0, count: n+1)
var edges = [Edge]()

for i in 0..<n+1 {
    parent[i] = i
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges.append((input[0], input[1], input[2]))
}

edges.sort { $0.c < $1.c }

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let a = find(a)
    let b = find(b)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

var result = 0
for edge in edges {
    if find(edge.a) != find(edge.b) {
        union(edge.a, edge.b)
        result += edge.c
    }
}
print(result)
