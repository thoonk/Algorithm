//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/07.
//

import Foundation

func solution(){
    let inf = Int(1e9)
    // 노드의 개수 및 간선의 개수 입력
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    // 2차원 배열을 무한으로 초기화
    var graph = Array(repeating: Array(repeating: inf, count: n+1), count: n+1)
    // 자기 자신에서 자기 자신으로 가는 비용 0으로 초기화
    for a in stride(from: 1, to: n+1, by: 1){
        for b in stride(from: 1, to: n+1, by: 1){
            if a == b{
                graph[a][b] = 0
            }
        }
    }
    // 각 간선 정보를 입력받아, 그 값으로 초기화
    for _ in stride(from: 0, to: m, by: 1){
        // a에서 b로 가는 비용은 c
        let abc = readLine()!.split(separator: " ").map {Int($0)!}
        //graph[abc[0]][abc[1]] = abc[2]
        // 중복된 간선에 다른 비용이 들어오는 경우 최솟 값으로 초기화
        if graph[abc[0]][abc[1]] > abc[2] {
            graph[abc[0]][abc[1]] = abc[2]
        }
    }
    // 플로이드 워셜 알고리즘 수행
    for k in stride(from: 1, to: n+1, by: 1){
        for a in stride(from: 1, to: n+1, by: 1){
            for b in stride(from: 1, to: n+1, by: 1){
                graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
            }
        }
    }
    // 결과 출력
    for a in stride(from: 1, to: n+1, by: 1){
        for b in stride(from: 1, to: n+1, by: 1){
            if graph[a][b] == inf{
                print("INFINITY", terminator: " ")
            }
            else {
                print(graph[a][b], terminator: " ")
            }
        }
        print()
    }
}
solution()

/*
4
7
1 2 4
1 4 6
2 1 3
2 3 7
3 1 5
3 4 4
4 3 2
 */
