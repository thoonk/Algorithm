//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/06.
//  큐 / 큐

let n = Int(readLine()!)!
var q = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let cmd = input[0]
    
    if cmd == "push" {
        q.append(Int(input[1])!)
    } else if cmd == "pop" {
        if q.isEmpty {
            print(-1)
        } else {
            print(q.removeFirst())
        }
    } else if cmd == "size" {
        print(q.count)
    } else if cmd == "empty" {
        if q.isEmpty {
            print(1)
        } else {
            print(0)
        }
    } else if cmd == "front" {
        if q.isEmpty {
            print(-1)
        } else {
            print(q.first!)
        }
    } else if cmd == "back" {
        if q.isEmpty {
            print(-1)
        } else {
            print(q.last!)
        }
    }
}
