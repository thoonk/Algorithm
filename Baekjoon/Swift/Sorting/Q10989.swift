//
//  Q10989.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/25.
//  수 정렬하기 3 / 정렬

import Foundation

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

func solution() {
    let file = FileIO()
    let n = file.readInt()
    // counting sort 응용
    var counter = [Int](repeating: 0, count: 10001)
    var res = ""
    
    for _ in 0..<n {
        let k = file.readInt()
        counter[Int(k)] += 1
    }
    
    // counter에 누적된 수만큼 해당 수를 반복하여 출력함.
    for i in 0..<10001 {
        res += String(repeating: "\(i)\n", count: counter[i])
    }
    print(res)
}
solution()
