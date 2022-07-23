//
//  Q18258.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/12.
//  큐2 / 큐

import Foundation

// 라이노님 빠른 입력 FileIO
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
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> Int {
        var str = 0
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += Int(now)
            now = read()
        }
        
        return str
    }
}

// 2개의 스택(배열)을 이용한 큐 구현
struct Queue {
    var left = [Int]()
    var right = [Int]()
    
    var count: Int {
        left.count + right.count
    }
    
    var isEmpty: Bool {
        left.isEmpty && right.isEmpty
    }
    
    var first: Int? {
        guard !isEmpty else { return -1 }
        
        if right.isEmpty {
            return left.first
        } else {
            return right.last
        }
    }
    
    var last: Int? {
        guard !isEmpty else { return -1 }
        
        if left.isEmpty {
            return right.first
        } else {
            return left.last
        }
    }
    
    mutating func enqueue(_ value: Int) {
        left.append(value)
    }
    
    mutating func dequeue() -> Int? {
        guard !isEmpty else { return -1 }
        
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        return right.popLast()
    }
}

let file = FileIO()
var q = Queue()
var res = ""

for _ in 0 ..< file.readInt() {
    // 아스키 코드로 입력 받아서 Int형으로 바꾸는 시간을 줄임
    let cmd = file.readString()
    // push
    if cmd == 448 {
        q.enqueue(file.readInt())
    }
    // pop
    else if cmd == 335 {
        res += q.isEmpty ? "-1\n" : "\(q.dequeue()!)\n"
    }
    // size
    else if cmd == 443 {
        res += "\(q.count)\n"
    }
    // empty
    else if cmd == 559 {
        res += q.isEmpty ? "1\n" : "0\n"
    }
    // front
    else if cmd == 553 {
        res += "\(q.first!)\n"
    }
    // back
    else if cmd == 401 {
        res += "\(q.last!)\n"
    }
}
print(res)
