//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/06.
//

struct Heap<T> {
    var nodes = [T]()
    var comparer: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        comparer = sort
    }
    
    var isEmpty: Bool {
        nodes.isEmpty
    }
    
    func getParent(_ i: Int) -> Int {
        return (i-1)/2
    }
    
    func getLeft(_ i: Int) -> Int {
        return i*2+1
    }
    
    func getRight(_ i: Int) -> Int {
        return i*2+2
    }
    
    mutating func insert(_ value: T) {
        var index = nodes.count
        nodes.append(value)
        
        while index > 0, !(comparer(nodes[index], nodes[getParent(index)])) {
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

struct EdgeData: Comparable {
    var node: Int
    var cost: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        lhs.cost < rhs.cost
    }
}

let inf = Int(1e9)
let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let v = ve[0]
let e = ve[1]
let start = Int(readLine()!)! - 1
var graph = Array(repeating: [(Int, Int)](), count: v)

for _ in 0 ..< e {
    let uvw = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[uvw[0]-1].append((uvw[1]-1, uvw[2]))
}

solution()

func solution() {
    var pq = Heap<EdgeData>(sort: >)
    var dist = [Int](repeating: inf, count: v)
    
    pq.insert(EdgeData(node: start, cost: 0))
    dist[start] = 0
    
    while !pq.isEmpty {
        let now = pq.remove()!
        
        if dist[now.node] < now.cost {
            continue
        }
        
        for i in graph[now.node] {
            let newCost = now.cost + i.1
            if newCost < dist[i.0] {
                dist[i.0] = newCost
                pq.insert(EdgeData(node: i.0, cost: newCost))
            }
        }
    }
    
    for i in 0 ..< v {
        print(dist[i] == inf ? "INF" : dist[i])
    }
}
