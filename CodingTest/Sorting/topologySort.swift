//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/10.
//  위상 정렬 (비 사이클의 경우)

import Foundation

func solution(){
    let ve = readLine()!.split(separator: " ").map {Int($0)!}
    let v = ve[0]
    let e = ve[1]
    // 모든 노드에 대한 진입차수는 0으로 초기화
    var indegree = Array(repeating: 0, count: v+1)
    var graph = Array(repeating: [(Int)](), count: v+1)
    // 방향 그래프의 모든 간선 정보 입력
    for _ in stride(from: 0, to: e, by: 1){
        // 노드 a에서 b로 이동 가능
        let ab = readLine()!.split(separator: " ").map {Int($0)!}
        graph[ab[0]].append(ab[1])
        // 진입차수를 1 증가
        indegree[ab[1]] += 1
    }
    
    func topologySort() {
        var result = [Int]()
        var q = [Int]()
        // 처음 시작할 때 진입차수가 0인 노드 큐에 삽입
        for i in stride(from: 1, to: v+1, by: 1){
            if indegree[i] == 0{
                q.append(i)
            }
        }
        
        while !q.isEmpty{
            let now = q.removeFirst()
            result.append(now)
            // 해당 노드와 연결된 노드들의 진입차수에서 1 빼기
            for i in graph[now]{
                indegree[i] -= 1
                // 새롭게 진입차수가 0이 되는 노드를 큐에 삽입
                if indegree[i] == 0 {
                    q.append(i)
                }
            }
        }
        
        for i in result{
            print(i, terminator: " ")
        }
    }
    topologySort()
}
solution()

/*
7 8
1 2
1 5
2 3
2 6
3 4
4 7
5 6
6 4
*/
