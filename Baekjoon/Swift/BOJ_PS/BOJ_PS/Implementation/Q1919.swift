//
//  Q1919.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/23.
//  애너그램 만들기 - 구현, 문자열

var first = readLine()!
var second = readLine()!
var counter = [Int](repeating: 0, count: 26)

for s in first {
    counter[Int(s.asciiValue!)-97] += 1
}

for s in second {
    counter[Int(s.asciiValue!)-97] -= 1
}
print(
    counter
        .filter({ $0 != 0 })
        .map({ abs($0) })
        .reduce(0,+)
)
