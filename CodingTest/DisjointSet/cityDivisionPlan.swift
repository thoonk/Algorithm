//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/11.
//  도시 분할 계획 (크루스칼 알고리즘)

import Foundation

struct EdgeData: Comparable{
    var cost: Int
    var a: Int
    var b: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
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
    
    if a > b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

func solution(){
    let nm = readLine()!.split(separator: " ").map {Int($0)!}
    let n = nm[0]
    let m = nm[1]
    
    var parent = Array(repeating: 0, count: n+1)
    var edges = Array(repeating: EdgeData(cost: 0, a: 0, b: 0), count: m)
    
    var result = 0

    for i in stride(from: 1, to: n+1, by: 1){
        parent[i] = i
    }
    
    for _ in stride(from: 0, to: m, by: 1){
        let abc = readLine()!.split(separator: " ").map {Int($0)!}
        edges.append(EdgeData(cost: abc[2], a: abc[0], b: abc[1]))
    }
    edges.sort()
    // 간선 중 가장 비용이 큰 간선
    var maxCost = 0
    
    for edge in edges {
        let cost = edge.cost
        let a = edge.a
        let b = edge.b
        // 사이클 발생하지 않는 경우에만 집합에 포함
        if findParent(&parent, a) != findParent(&parent, b){
            unionParent(&parent, a, b)
            result += cost
            maxCost = cost
        }
    }
    print(result - maxCost)
}
solution()

/*
7 12
1 2 3
1 3 2
3 2 1
2 5 2
3 4 4
7 3 6
5 1 5
1 6 2
6 4 1
6 5 3
4 5 3
6 7 4
*/
