//
//  Q10799.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/23.
//  쇠막대기 / 스택

let parenthesis = Array(readLine()!)
var stack = [Character]()
var res = 0

for (i, p) in parenthesis.enumerated() {
    if p == "(" {
        stack.append(p)
    }
    // p == ")"
    else {
        // "(()"의 경우
        if parenthesis[i-1] == "(" {
            stack.popLast()
            res += stack.count
        }
        // ")()"의 경우
        else {
            stack.popLast()
            res += 1
        }
    }
}
print(res)
