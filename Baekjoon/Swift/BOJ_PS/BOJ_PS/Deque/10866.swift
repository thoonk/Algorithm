//
//  10866.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/14.
//  덱 / 덱

struct Deque<T> {
    var arr = [T]()
    
    var count: Int { arr.count }
    var isEmpty: Bool { arr.isEmpty }
    var first: T? { arr.first }
    var last: T? { arr.last }
    
    mutating func pushFirst(_ n: T) {
        arr.insert(n, at: 0)
    }
    mutating func pushLast(_ n: T) {
        arr.append(n)
    }
    mutating func popFirst() -> T? {
        arr.isEmpty == true ? nil : arr.removeFirst()
    }
    mutating func popLast() -> T? {
        arr.popLast()
    }
}

var deque = Deque<String>()
for _ in 0 ..< Int(readLine()!)! {
    let cmd = readLine()!.split(separator: " ").map { String($0) }
    
    if cmd[0] == "push_front" {
        deque.pushFirst(cmd[1])
    } else if cmd[0] == "push_back" {
        deque.pushLast(cmd[1])
    } else if cmd[0] == "pop_front" {
        print(deque.popFirst() ?? -1)
    } else if cmd[0] == "pop_back" {
        print(deque.popLast() ?? -1)
    } else if cmd[0] == "size" {
        print(deque.count)
    } else if cmd[0] == "empty" {
        print(deque.isEmpty ? 1 : 0)
    } else if cmd[0] == "front" {
        print(deque.first ?? -1)
    } else if cmd[0] == "back" {
        print(deque.last ?? -1)
    }
}

