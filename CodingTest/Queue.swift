//
//  Queue.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/31.
//

import Foundation

public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    public mutating func dequeue() -> T? {
        if isEmpty { return nil }
        else { return array.removeFirst() }
    }
    public var front: T? {
        return array.first
    }
}
