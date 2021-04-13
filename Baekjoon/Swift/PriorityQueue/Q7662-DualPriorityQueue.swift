//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/13.
//  이중 우선순위 큐

import Foundation

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
        self.init(comparer: <)
    }
}

struct MaxData: Comparable {

    var value: Int
    var node: Int
    var key: Int
    
    static func < (lhs: MaxData, rhs: MaxData) -> Bool {
        lhs.value < rhs.value
    }
}

struct MinData: Comparable {
    var value: Int
    var node: Int
    var key: Int
    
    static func < (lhs: MinData, rhs: MinData) -> Bool {
        lhs.value > rhs.value
    }
}

func solution() {
    let k = Int(readLine()!)!
    var maxPQ = Heap<MaxData>()
    var minPQ = Heap<MinData>()
    var check = [Bool](repeating: false, count: 1000001)
    var index = 0
    for i in 0 ..< k {
        let input = readLine()!.split(separator: " ").map { String($0) }
        let cmd = input[0]
        let n = Int(input[1])!
        if cmd == "I" {
            maxPQ.insert(MaxData(value: n, node: index, key: i))
            minPQ.insert(MinData(value: n, node: index, key: i))
            index += 1
            check[i] = true
        } else if cmd == "D" {
            if n == 1 {
                while !maxPQ.isEmpty && check[maxPQ.peek()!.key] == false {
                    maxPQ.remove()
                }
                if !maxPQ.isEmpty {
                    check[maxPQ.peek()!.key] = false
                    maxPQ.remove()
                }
            } else if n == -1 {
                while !minPQ.isEmpty && !check[minPQ.peek()!.key] {
                    minPQ.remove()
                }
                if !minPQ.isEmpty {
                    check[minPQ.peek()!.key] = false
                    minPQ.remove()
                }
            }
        }
    }
    print(maxPQ, minPQ)
    while !minPQ.isEmpty && !check[minPQ.peek()!.key] {
        minPQ.remove()
    }
    
    while !maxPQ.isEmpty && !check[maxPQ.peek()!.key] {
        maxPQ.remove()
        
    }

    guard !maxPQ.isEmpty && !minPQ.isEmpty else {
        print("EMPTY")
        return
    }
    
    print(maxPQ.peek()!.value, minPQ.peek()!.value)
}

let t = Int(readLine()!)!

for _ in 0 ..< t {
    solution()
}

