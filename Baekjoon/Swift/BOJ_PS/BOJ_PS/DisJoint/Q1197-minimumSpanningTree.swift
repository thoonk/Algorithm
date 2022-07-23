//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/12.
//  Q1197 최소 스패닝 크리

import Foundation

struct EdgeData: Comparable {
    var a: Int
    var b: Int
    var c: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.c < rhs.c
    }
}

let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let v = ve[0]
let e = ve[1]
solution()

func solution() {
    var parent = [Int](repeating: 0, count: v)
    var edges = [EdgeData]()
    var result = 0
    
    // 부모를 자기 자신으로 초기화
    for i in 0 ..< v {
        parent[i] = i
    }
    
    for _ in 0 ..< e {
        let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
        edges.append(EdgeData(a: abc[0]-1, b: abc[1]-1, c: abc[2]))
    }
    
    edges.sort()
    
    for edge in edges {
        if findParent(&parent, edge.a) != findParent(&parent, edge.b) {
            unionParent(&parent, edge.a, edge.b)
            result += edge.c
        }
    }
    print(result)
}

func findParent(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = findParent(&parent, parent[x])
    }
    return parent[x]
}

func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = findParent(&parent, a)
    let b = findParent(&parent, b)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}


