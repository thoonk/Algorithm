//
//  Q10808.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/22.
//  알파벳 개수 / 구현, 문자열

let s = readLine()!
var res = [Int](repeating: 0, count: 26)

for alpha in s {
    let index = Int(alpha.asciiValue!) - 97
    res[index] += 1
}

res.forEach { print($0, terminator: " ")}
