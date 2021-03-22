//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/03/22.
//  제로 구현 스택

import Foundation

var k = Int(readLine()!)!

var stack = [Int]()

for _ in 0..<k {
    let input = Int(readLine()!)!
    if input != 0 {
        stack.append(input)
    } else {
        stack.removeLast()
    }
}

print(stack.reduce(0,+))
