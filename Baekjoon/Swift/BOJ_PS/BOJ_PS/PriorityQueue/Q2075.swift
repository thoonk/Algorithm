//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/05.
//  N번째 큰 수 / 우선순위 큐 시간초과

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

    @inline(__always) func readInt() -> Int32 {
        var sum: Int32 = 0
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
            sum = sum * 10 + Int32(now-48)
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
    var count: Int { nodes.count }
    
    init(sort: @escaping (T,T) -> Bool) {
        self.comparer = sort
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

let file = FileIO()
var n = file.readInt()

var pq = Heap<Int>(sort: <)

for _ in 0 ..< n {
    for _ in 0 ..< n {
        pq.insert(Int(file.readInt()))
    }
}

for _ in 0 ..< n - 1 {
    pq.remove()!
}

print(pq.peek()!)
