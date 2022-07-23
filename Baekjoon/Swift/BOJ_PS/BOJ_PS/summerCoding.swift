//
//  summerCoding.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/09.
//

import Foundation

public struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.comparer = sort
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

struct Person: Comparable {
    var index: Int
    var t: Int
    var r: Int
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.r == rhs.r ? (lhs.t == rhs.t ? lhs.index < lhs.index : lhs.t < rhs.t) : lhs.r < rhs.r
    }
}

func solution(_ t:[Int], _ r:[Int]) -> [Int] {
    var res = [Int]()
    // 해당 타임일 때, r -> t -> index
    guard t.count > 0 else { return [] }
    let maxTime = t.max()!
    // 손님 번호 큐
    var pq = Heap<Person>(sort: >)
    let t = t.sorted()
    
    for i in 0 ... maxTime {
        for j in 0 ..< t.count {
            if t[j] == i {
                pq.insert(Person(index: j, t: t[j]+1, r: r[j]))
            }
        }
        print(i, pq)
        if !pq.isEmpty {
            let temp = pq.remove()!
            res.append(temp.index)
        }
    }
    
    return res
}
//print(solution([0,1,3,0], [0,1,2,3]))
print(solution([7,6,8,1],[0,1,2,3]))
