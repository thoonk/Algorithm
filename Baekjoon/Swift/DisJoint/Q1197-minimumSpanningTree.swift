//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/12.
//  Q1197 최소 스패닝 크리

import Foundation

struct EdgeData: Comparable {
    var cost: Int
    var a: Int
    var b: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool{
        lhs.cost < rhs.cost
    }
}

func findParent(_ parent: inout [Int], _ x: Int) -> Int{
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

func solution(){
    
    let ve = readLine()!.split(separator: " ").map {Int($0)!}
    let v = ve[0]
    let e = ve[1]
    
    var parent = Array(repeating: 0, count: v+1)
    var edges = Array(repeating: EdgeData(cost: 0, a: 0, b: 0), count: e)
    
    for i in stride(from: 1, to: v+1, by: 1){
        parent[i] = i
    }
    
    for _ in stride(from: 0, to: e, by: 1) {
        let abc = readLine()!.split(separator: " ").map {Int($0)!}
        edges.append(EdgeData(cost: abc[2], a: abc[0], b: abc[1]))
    }
    edges.sort()
    
    var result = 0
    for edge in edges {
        let cost = edge.cost
        let a = edge.a
        let b = edge.b
        
        if findParent(&parent, a) != findParent(&parent, b){
            unionParent(&parent, a, b)
            result += cost
        }
    }
    print(result)
}

solution()

