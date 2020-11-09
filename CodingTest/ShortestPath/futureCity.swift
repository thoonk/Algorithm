//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/09.
//  미래 도시 (플로이드 워셜)

import Foundation

func solution() {
    let inf = Int(1e9)
    
    let nm = readLine()!.split(separator: " ").map {Int($0)!}
    let node = nm[0]
    let edge = nm[1]
    
    var graph = Array(repeating: Array(repeating: inf, count: node+1), count: node+1)
    
    // 자기 자신에서 자기 자신으로 가는 비용 0으로 초기화
    for a in stride(from: 1, to: node+1, by: 1){
        for b in stride(from: 1, to: node+1, by: 1){
            if a == b {
                graph[a][b] = 0
            }
        }
    }
    // 비용 1로 초기화
    for _ in stride(from: 0, to: edge, by: 1) {
        let ab = readLine()!.split(separator: " ").map {Int($0)!}
        graph[ab[0]][ab[1]] = 1
        graph[ab[1]][ab[0]] = 1
    }
    // 거쳐갈 노드 k와 최종 목적지 노드 x 입력
    let xk = readLine()!.split(separator: " ").map {Int($0)!}
    // 플로이드 워셜 알고리즘 수행
    for k in stride(from: 1, to: node+1, by: 1){
        for a in stride(from: 1, to: node+1, by: 1){
            for b in stride(from: 1, to: node+1, by: 1){
                graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
            }
        }
    }
    // k를 거쳐서 x 노드에 가는데 걸린 거리
    let distance = graph[1][xk[1]] + graph[xk[1]][xk[0]]
    
    if distance >= inf{
        print(-1)
    } else{
        print(distance)
    }
}
solution()

/*
5 7
1 2
1 3
1 4
2 4
3 4
3 5
4 5
4 5
 */
