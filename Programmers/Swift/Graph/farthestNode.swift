//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/02/03.
//  가장 먼 노드 Level3

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // 거리에 대한
    var distance = [Int](repeating: 0, count: n+1)
    var graph = [[Int]](repeating: [Int](), count: n+1)

    for i in edge.indices {
        // 간선 양방향
        graph[edge[i][0]].append(edge[i][1])
        graph[edge[i][1]].append(edge[i][0])
    }

    bfs(&distance, graph)
    // 제일 먼 거리를 기준으로 내림차순 정렬
    distance.sort(by: >)
    // 제일 먼 거리와 같은 거리의 개수 반환
    return distance.filter { $0 == distance.first }.count
}

func bfs(_ distance: inout [Int], _ graph: [[Int]]) {
    var q = [Int]()
    // 1번 시작 노드 초기화
    q.append(1)
    distance[1] = 1
    // 시간을 줄이기 위해 인덱스로 큐 순회
    var idx = 0
    while idx < q.count {
        let now = q[idx]
        idx += 1

        for next in graph[now] where distance[next] < 1 {
            distance[next] = distance[now] + 1
            q.append(next)
        }
    }
}

print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
