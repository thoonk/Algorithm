//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/10.
//  크루스칼 알고리즘 (최소 신장 트리)

import Foundation

struct EdgeData: Comparable {
    var cost: Int
    var a: Int
    var b: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
}

// 특정 원소가 속한 집합 찾기 (경로 압축 기법)
func findParent(_ parent: inout [Int], _ x: Int)-> Int {
    // 루트 노드가 아니라면, 루트 노드를 찾을 때까지 재귀적으로 호출
    if parent[x] != x {
        parent[x] = findParent(&parent, parent[x])
    }
    return parent[x]
}
// 두 원소가 속한 집합 합치기
func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let a = findParent(&parent, a)
    let b = findParent(&parent, b)
    if a < b {
        parent[b] = a
    } else{
        parent[a] = b
    }
}

func solution(){
    let ve = readLine()!.split(separator: " ").map {Int($0)!}
    let v = ve[0]
    let e = ve[1]
    
    var parent = Array(repeating: 0, count: v+1)
    // 모든 간선을 담을 리스트와 최종 비용을 담을 변수
    var edges = Array(repeating: EdgeData(cost: 0, a: 0, b: 0), count: e)
    var result = 0
    
    for i in stride(from: 1, to: v+1, by: 1){
        parent[i] = i
    }
    // 모든 간선에 대한 정보 입력
    for _ in stride(from: 0, to: e, by: 1){
        // 노드 a에서 노드 b로 가는 cost
        let abc = readLine()!.split(separator: " ").map {Int($0)!}
        edges.append(EdgeData(cost: abc[2], a: abc[0], b: abc[1]))
    }
    // 모든 간선에 대해 비용 기준 정렬
    edges.sort()
    
    for edge in edges {
        let cost = edge.cost
        let a = edge.a
        let b = edge.b
        // 사이클이 발생하지 않는 경우에만 집합에 포함
        if findParent(&parent, a) != findParent(&parent, b){
            unionParent(&parent, a, b)
            result += cost
        }
        
    }
    print(result)
}
solution()

/*
7 9
1 2 29
1 5 75
2 3 35
2 6 34
3 4 7
4 6 23
4 7 13
5 6 53
6 7 25
*/
