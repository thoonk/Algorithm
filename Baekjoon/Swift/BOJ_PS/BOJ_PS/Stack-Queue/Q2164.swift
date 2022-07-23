//
//  Q2164.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/12.
//  카드2 / 큐

struct Queue {
    var left = [Int]()
    var right = [Int]()
    
    var count: Int {
        left.count + right.count
    }
    
    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }
    
    mutating func enqueue(_ n: Int) {
        left.append(n)
    }
    
    mutating func dequeue() -> Int? {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
}

var q = Queue()
for i in 1 ... Int(readLine()!)! {
    q.enqueue(i)
}

func solution() -> Int {
    while q.count > 1 {
        q.dequeue()
        q.enqueue(q.dequeue()!)
    }
    return q.dequeue()!
}

print(solution())
