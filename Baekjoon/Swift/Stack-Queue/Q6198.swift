//
//  Q6198.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/16.
//  옥상 정원 꾸미기 / 스택

let n = Int(readLine()!)!
var res = 0
var stack = [Int]()

for _ in 0 ..< n {
    let input = Int(readLine()!)!
    while !stack.isEmpty && input >= stack.last! {
        stack.popLast()
    }
    res += stack.count
    stack.append(input)
}
print(res)
