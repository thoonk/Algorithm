//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/09.
//  전보 (다익스트라)

import Foundation

struct EdgeData: Comparable {
    var cost: Int
    var node: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
}

func solution(){
    let inf = Int(1e9)
    // 도시의 개수 n, 통로의 개수 m, 메시지 보내는 도시 c
    let nmc = readLine()!.split(separator: " ").map {Int($0)!}
    let n = nmc[0]
    let m = nmc[1]
    let c = nmc[2] - 1
    
    var graph = Array(repeating: [(Int,Int)](), count: n)
    var distance = Array(repeating: inf, count: n)
    distance[c] = 0
    // 모든 통로 정보 입력
    for _ in stride(from: 0, to: m, by: 1){
        let xyz = readLine()!.split(separator: " ").map {Int($0)!}
        graph[xyz[0]-1].append((xyz[1]-1, xyz[2]))
    }
    
    var pq: Heap = Heap<EdgeData>()
    pq.insert(EdgeData(cost: 0, node: c))
    
    while !pq.isEmpty {
        let now = pq.delete()!
        
        if distance[now.node] < now.cost{
            continue
        }
        
        for i in graph[now.node] {
            if now.cost + i.1 < distance[i.0] {
                distance[i.0] = now.cost + i.1
                pq.insert(EdgeData(cost: now.cost, node: i.0))
            }
        }
    }
    // 메시지 받는 도시 개수 체크
    var cnt = 0
    // 최대 거리의 도시의 비용으로 총 걸리는 시간 체크
    var maxDistance = 0
    print(distance)
    for d in distance{
        if d != inf {
            cnt += 1
            maxDistance = max(d, maxDistance)
        }
    }
    // 자기 자신 제외
    print(cnt - 1, maxDistance)
}
solution()
