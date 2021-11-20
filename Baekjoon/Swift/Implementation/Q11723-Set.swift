//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/13.
//  집합 비트마스크 구현

import Foundation

final class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStringSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

let file = FileIO()
var s = 0
var output = ""

for _ in 0..<file.readInt() {
    let input = file.readStringSum()
    switch input {
    case 313: // all
        s |= (1 << 21) - 1
    case 559: // empty
        s &= 0
    case 297: // add
        s |= 1 << file.readInt()
    case 654: // remove
        s &= ~(1 << file.readInt())
    case 510: // check
        let n = file.readInt()
        output.append("\((s & 1 << n) >> n)\n")
    case 642: // toggle
        s ^= 1 << file.readInt()
    default:
        break
    }
}

print(output)

