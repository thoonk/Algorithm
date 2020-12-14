//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/13.
//  Q1931 회의실 배정 그리디

import Foundation

let n = Int(readLine()!)!

var session = [(Int,Int)]()

for _ in 0 ..< n {
    let s = readLine()!.split(separator: " ").map {Int(String($0))!}
    session.append((s[0],s[1]))
}

session.sort (by: { $0.0 < $1.0 })
session.sort(by: { $0.1 < $1.1 })

var temp = 0
var result = 0

for s in session {
    if s.0 >= temp {
        temp = s.1
        result += 1
    }
}
print(result)

