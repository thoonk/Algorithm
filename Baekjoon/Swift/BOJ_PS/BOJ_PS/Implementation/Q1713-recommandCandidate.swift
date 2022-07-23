//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/22.
//  후보 추천하기 구현

let n = Int(readLine()!)!
let totalRcmd = Int(readLine()!)!
var students = readLine()!.split(separator: " ").map { Int(String($0))! }

// frame[i]: 후보 학생들의 번호
var frame = [Int]()
// 후보의 추천횟수
var rcmdCnt = [Int]()
for i in 0 ..< totalRcmd {
    // 사진틀에 있음
    if frame.contains(students[i]) {
        for j in 0 ..< frame.count {
            if students[i] == frame[j] {
                rcmdCnt[j] += 1
            }
        }
    }
    // 사진틀에 없음
    else {
        if frame.count >= n {
            for j in 0 ..< n {
                if rcmdCnt[j] == rcmdCnt.min() {
                    frame.remove(at: j)
                    rcmdCnt.remove(at: j)
                    break
                }
            }
        }
        frame.append(students[i])
        rcmdCnt.append(1)
    }
    print(frame, rcmdCnt)
}
frame.sort()
print(frame.map { String($0) }.joined(separator:" "))

