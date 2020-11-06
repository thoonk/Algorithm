//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/04.
//

import Foundation

var inf = Int(1e9)
// 노드의 개수, 간선 입력
let nums = readLine()!.split(separator: " ").map {Int($0)!}
let n = nums[0]
let m = nums[1]
// 시작 노드 번호 입력
let start = Int(readLine()!)!
// 각 노드에 연결되어 있는 노드 리스트
var graph = Array(repeating: [(Int, Int)](), count: n+1)
// 방문 체크 리스트
var visited = Array(repeating: false, count: n+1)
// 최단 거리 테이블 무한으로 초기화
var distance = Array(repeating: inf, count: n+1)

// 모든 간선 정보 입력
for _ in stride(from: 0, to: m, by: 1){
    let edges = readLine()!.split(separator: " ").map {Int($0)!}
    graph[edges[0]].append((edges[1], edges[2]))
}

// 방문하지 않은 노드들 중 가장 최단 거리가 짧은 노드의 번호 반환
func getSmallestNode() -> Int {
    var minValue = inf
    var index = 0
    for i in stride(from: 1, to: n+1, by: 1){
        if distance[i] < minValue && !visited[i]{
            minValue = distance[i]
            index = i
        }
    }
    return index
}

func dijkstra(_ start: Int) {
    // 시작 노드 초기화
    distance[start] = 0
    visited[start] = true
    // 시작 노드에서 연결된 노드들과의 거리 노드 별로 distance에 할당
    for i in graph[start]{
        distance[i.0] = i.1
    }
    // 시작 노드를 제외한 전체 n-1개의 노드에 대한 반복
    for _ in stride(from: 0, to: n-1, by: 1){
        // 현재 최단 거리가 가장 짧은 노드를 꺼내서, 방문 처리
        let now = getSmallestNode()
        visited[now] = true
        // 현재 노드와 연결된 다른 노드 확인
        for i in graph[now]{
            let cost = distance[now] + i.1
            // 현재 노드를 거쳐서 다른 노드로 이동하는 거리가 더 짧은 경우
            if cost < distance[i.0]{
                distance[i.0] = cost
            }
        }
    }
}
// 다익스트라 알고리즘 수행
dijkstra(start)

// 시작 노드에서 모든 노드로 가기 위한 최단 거리 출력
for i in stride(from: 1, to: n+1, by: 1){
    // 도달할 수 없는 경우 INFINIT 출력
    if distance[i] == inf {
        print("INFINITY")
    }
    // 도달할 수 있는 경우 거리를 출력
    else{
        print(distance[i])
    }
}

/*
6 11
1
1 2 2
1 3 5
1 4 1
2 3 3
2 4 2
3 2 3
3 6 5
4 3 3
4 5 1
5 3 1
5 6 2
 */
