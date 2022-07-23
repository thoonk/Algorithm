//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/27.
//  가운데를 말해요 우선순위큐 시간초과(입력)

import Foundation
// 라이노님 빠른 입력 FileIO 클래스
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { // 공백과 줄바꿈 무시
            now = read()
        }
        
        if now == 45{ // 음수 처리
            isPositive.toggle()
            now = read()
        }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

struct Heap<T> {
    var nodes = [T]()
    var comparer: (T,T) -> Bool

    init(sort: @escaping (T,T) -> Bool) {
        comparer = sort
    }

    var isEmpty: Bool {
        nodes.isEmpty
    }

    var count: Int {
        nodes.count
    }

    func peek() -> T? {
        nodes.first
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
let file = FileIO()
//let n = Int(readLine()!)!
let n = file.readInt()
var left = Heap<Int>(sort: <)
var right = Heap<Int>(sort: >)

for _ in 0 ..< n {
    let input = file.readInt()

    if left.count == right.count {
        left.insert(input)
    } else {
        right.insert(input)
    }

    if !left.isEmpty && !right.isEmpty {
        if left.peek()! > right.peek()! {
            let leftValue = left.remove()!
            let rightValue = right.remove()!

            left.insert(rightValue)
            right.insert(leftValue)
        }
    }
    print(left.peek()!)
}

