//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/09.
//  최소 힙 우선순위 큐

public struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T, T) -> Bool
    
    public init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    func getParent(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func getLeftChild(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    func getRightChild(_ index: Int) -> Int {
        return index * 2 + 2
    }
    
    public mutating func insert(_ value: T) {
        var index = nodes.count
        nodes.append(value)
        
        // Max or Min Heapify
        while index > 0, !comparer(nodes[index], nodes[getParent(index)]) {
            nodes.swapAt(index, getParent(index))
            index = getParent(index)
        }
    }
    
    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        } else {
            let target = nodes.first
            nodes[0] = nodes.removeLast()
            
            var index = 0
            // Max or Min Heapify
            while index < nodes.count {
                let left = getLeftChild(index)
                let right = getRightChild(index)
                
                // 오른쪽 노드가 존재하는 경우
                if right < nodes.count {
                    // 오른쪽 노드가 Heapify되는 경우
                    if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                        nodes.swapAt(right, index)
                        index = right
                    }
                    // 왼쪽 노드가 Heapify되는 경우
                    else if !comparer(nodes[left], nodes[index]) {
                        nodes.swapAt(left, index)
                        index = left
                    } else {
                        break
                    }
                }
                // 오른쪽 노드가 존재하지 않는 경우
                else if left < nodes.count {
                    // 왼쪽 노드가 Heapify되는 경우
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
            
            return target
        }
    }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >)
    }
}

func solution() {
    for _ in 0 ..< n {
        let input = Int(readLine()!)!
        if input > 0 {
            minHeap.insert(input)
        } else {
            print(minHeap.remove() ?? 0)
        }
    }
}

let n = Int(readLine()!)!
var minHeap = Heap<Int>()
solution()
