//
//  Q15903.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/11.
//  카드 합체 놀이 / 그리디, 우선순위 큐

struct Heap {
    var nodes = [Int]()
    var comparer: (Int, Int) -> Bool
    
    public init(sort: @escaping (Int, Int) -> Bool) {
        comparer = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    func first() -> Int? {
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
    
    mutating func insert(_ value: Int) {
        var index = nodes.count
        nodes.append(value)
        
        while index > 0, !comparer(nodes[index], nodes[getParent(index)]) {
            nodes.swapAt(index, getParent(index))
            index = getParent(index)
        }
    }
    
    mutating func remove() -> Int? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeFirst()
        } else {
            let target = nodes.first
            nodes[0] = nodes.removeLast()
            
            var index = 0
            while index < nodes.count {
                let left = getLeftChild(index)
                let right = getRightChild(index)
                
                // 오른쪽 노드가 존재하는 경우
                if right < nodes.count {
                    // 오른쪽 노드가 Heapify되는 경우
                    if comparer(nodes[left], nodes[right]),
                       !comparer(nodes[right], nodes[index]) {
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

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var pq = Heap(sort: >)
var res = 0

func solution() {
    nums.forEach { pq.insert($0) }

    for _ in 0 ..< m {
        if let first = pq.remove(),
           let second = pq.remove() {
            
            let sum = first + second
            pq.insert(sum)
            pq.insert(sum)
        }
    }

    while !pq.isEmpty {
        res += pq.remove()!
    }
    print(res)
}

solution()
