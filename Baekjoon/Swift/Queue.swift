//
//  Queue.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/13.
//  큐 구현

import Foundation

// 인덱스를 이용한 큐 구현
struct Queue<T> {
    var q = [T]()
    var index = 0
    
    var count: Int { q.count - index }
    
    var isEmpty: Bool { q.count == index }
    
    var first: T? { index < q.count ? q[index] : nil }
    
    var last: T? { index < q.count ? q.last : nil }
    
    mutating func enqueue(_ value: T) {
        q.append(value)
    }
    
    mutating func dequeue() -> T? {
        if index < q.count {
            let now = q[index]
            index += 1
            return now
        } else {
            return nil
        }
    }
}

// 투 스택을 이용한 큐 구현
struct Queue<T> {
    var left = [T]()
    var right = [T]()
    
    var count: Int { left.count + right.count }
    
    var isEmpty: Bool { left.isEmpty && right.isEmpty }
    
    var first: T? { right.isEmpty ? left.first : right.last }
    
    var last: T? { left.isEmpty ? right.first : left.last }
    
    mutating func enqueue(_ value: T) {
        left.append(value)
    }
    
    mutating func dequeue() -> T? {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
}
