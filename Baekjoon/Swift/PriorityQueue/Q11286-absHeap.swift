//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/15.
//  절대값 힙 우선순위 큐

struct Heap<T> {
    var nodes = [T]()
    var comparer: (T,T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    init(sort: @escaping (T,T) -> Bool) {
        self.comparer = sort
    }
    
    func getParent(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func getLeftChild(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    func getRightChild(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    mutating func insert(_ value: T) {
        var index = nodes.count
        nodes.append(value)
        
        while index > 0, !comparer(nodes[index], nodes[getParent(index)]) {
            nodes.swapAt(index, getParent(index))
            index = getParent(index)
        }
    }
    
    mutating func remove() -> T? {
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

                if right < nodes.count {
                    if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                        nodes.swapAt(right, index)
                        index = right
                    } else if !comparer(nodes[left], nodes[index]) {
                        nodes.swapAt(left, index)
                        index = left
                    } else {
                        break
                    }
                } else if left < nodes.count {
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

struct AbsData: Comparable {
    var value: Int
    var absValue: Int
    
    static func < (lhs: AbsData, rhs: AbsData) -> Bool {
        lhs.absValue == rhs.absValue ? lhs.value < rhs.value : lhs.absValue < rhs.absValue
    }
}


let n = Int(readLine()!)!
var absPQ = Heap<AbsData>(sort: >)

for _ in 0 ..< n {
    let x = Int(readLine()!)!
    
    if x != 0 {
        absPQ.insert(AbsData(value: x, absValue: abs(x)))
    } else {
        if absPQ.isEmpty {
            print(0)
        } else {
            let minValue = absPQ.remove()!
            print(minValue.value)
        }
    }
}
