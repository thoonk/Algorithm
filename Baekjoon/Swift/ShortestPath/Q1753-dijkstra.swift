//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/06.
//

import Foundation

public struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T,T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        // (MaxHeap) 새로운 값보다 그 값의 부모가 더 작다면 스왑
        while index > 0, !comparer(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index - 1) / 2
        }
    }
    
    mutating func delete() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        // (MaxHeap) 제일 큰 값 꺼내기
        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        nodes.popLast()
        
        var index = 0
        // Max Heapify
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            // 오른쪽 노드가 존재하는 경우
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                   !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                } else{
                    break
                }
            }
            // 왼쪽 노드가 존재하는 경우
            else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        return result
    }
}

extension Heap where T: Comparable{
    init() {
        self.init(comparer: >)
    }
}

struct EdgeData: Comparable {
    var cost: Int
    var node: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
}

func solution(){
    let inf = Int(1e9)
    // 노드의 개수, 간선의 개수를 입력
    let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
    let n = nm[0]
    let m = nm[1]
    // 시작 노드 번호 입력
    let start = Int(readLine()!)! - 1
    // 각 노드에 연결되어 있는 노드 리스트
    var graph = Array(repeating: [(Int, Int)](), count: n)
    // 최단 거리 테이블 무한으로 초기화
    var distance = Array(repeating: inf, count: n)
    distance[start] = 0
    
    // 모든 간선 정보 입력
    for _ in stride(from: 0, to: m, by: 1){
        let edges = readLine()!.split(separator: " ").map {Int(String($0))!}
        graph[edges[0]-1].append((edges[1]-1, edges[2]))
    }
    // 우선순위 큐
    var pq: Heap = Heap<EdgeData>()
    // 시작 노드이므로 최단 경로 0으로 설정하여 삽입
    pq.insert(EdgeData(cost: 0, node: start))
    
    while(!pq.isEmpty){
        // 가장 최단 거리의 노드에 대한 정보 꺼내기
        let now = pq.delete()!
        // 현재 노드가 이미 처리된 적이 있는 노드라면 무시
        if distance[now.node] < now.cost {
            continue
        }
        
        for i in graph[now.node] {
            // 현재 노드를 거쳐서 다른 노드로 이동하는 거리가 더 짧은 경우
            if now.cost + i.1 < distance[i.0] {
                distance[i.0] = now.cost + i.1
                pq.insert(EdgeData(cost: now.cost + i.1, node: i.0))
            }
        }
    }
    // 모든 노드로 가기 위한 최단 거리 출력
    for i in distance {
        if i == inf {
            print("INF")
        } else {
            print(i)
        }
    }
}
solution()



