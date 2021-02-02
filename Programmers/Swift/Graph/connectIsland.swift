//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/02/02.
//  섬 연결하기 Level3 크루스칼

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var result = 0
    var parent = [Int](repeating: 0, count: n+1)
    let sortedCosts = costs.sorted { $0[2] < $1[2] }
    
    for i in 1..<n+1 {
        parent[i] = i
    }
    
    for cost in sortedCosts {
        if findParent(&parent, cost[0]) != findParent(&parent, cost[1]) {
            unionParent(&parent, cost[0], cost[1])
            result += cost[2]
        }
    }
    print(sortedCosts)
    
    return result
}

func findParent(_ parent: inout [Int], _ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = findParent(&parent, parent[x])
    }
    return parent[x]
}

func unionParent(_ parent: inout [Int], _ a: Int, _ b: Int)  {
    let a = findParent(&parent, a)
    let b = findParent(&parent, b)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))
