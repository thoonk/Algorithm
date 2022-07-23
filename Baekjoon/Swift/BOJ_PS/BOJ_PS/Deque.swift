//
//  Deque.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/14.
//

struct Deque<T: Equatable> {
    var left = [T]()
    var right = [T]()

    var count: Int { left.count + right.count }

    var isEmpty: Bool { left.isEmpty && right.isEmpty }

    var first: T? { right.isEmpty ? left.first : right.last }

    var last: T? { left.isEmpty ? right.first : left.last }

    mutating func pushFirst(_ n: T) {
        right.append(n)
    }

    mutating func pushLast(_ n: T) {
        left.append(n)
    }

    mutating func popFirst() -> T? {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }

    mutating func popLast() -> T? {
        var retVal: T?
        if left.isEmpty {
            right.reverse()
            retVal = right.popLast()
            right.reverse()
        } else {
            retVal = left.popLast()
        }
        return retVal
    }
}
