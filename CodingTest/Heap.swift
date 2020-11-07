//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/07.
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


