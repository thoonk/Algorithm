//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/19.
//  중앙값 구하기 이중 우선순위 큐

struct Heap<T> {
    var nodes = [T]()
    var comparer: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.comparer = sort
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    var count: Int {
        nodes.count
    }
    
    func getParent(_ i: Int) -> Int {
        (i-1)/2
    }
    
    func getLeft(_ i: Int) -> Int {
        2*i+1
    }
    
    func getRight(_ i: Int) -> Int {
        2*i+2
    }
    
    func peek() -> T? {
        nodes.first
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
            let target = nodes[0]
            nodes[0] = nodes.removeLast()
            
            var index = 0
            while index < nodes.count {
                let left = getLeft(index)
                let right = getRight(index)
                
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

let t = Int(readLine()!)!

for _ in 0 ..< t {
    let m = Int(readLine()!)!
    let inputLine = m % 10 == 0 ? m / 10 : m / 10 + 1
    var nums = [Int]()
    for _ in 0 ..< inputLine {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        nums += input
    }
    var maxPQ = Heap<Int>(sort: <)
    var minPQ = Heap<Int>(sort: >)
    var outputLine = 0
    
    print(m/2+1)
    for i in 0 ..< m {
        if maxPQ.count == minPQ.count {
            maxPQ.insert(nums[i])
        } else {
            minPQ.insert(nums[i])
        }
        
        if !maxPQ.isEmpty && !minPQ.isEmpty {
            if maxPQ.peek()! > minPQ.peek()! {
                let maxValue = maxPQ.remove()!
                let minValue = minPQ.remove()!
                
                maxPQ.insert(minValue)
                minPQ.insert(maxValue)
            }
        }
                
        if (i+1) % 2 == 1 {
            print(maxPQ.peek()!, terminator:" ")
            outputLine += 1
            if outputLine % 10 == 0 {
                print()
            }
        }
    }
    print()
}
