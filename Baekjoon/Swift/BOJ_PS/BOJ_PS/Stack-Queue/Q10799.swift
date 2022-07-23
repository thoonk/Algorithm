//
//  Q10799.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/23.
//  쇠막대기 / 스택

let paren = Array(readLine()!)
var stack = [Character]()
var res = 0

for (i, p) in paren.enumerated() {
    if p == "(" {
        stack.append(p)
    }
    // p == ")"
    else {
        // "()"의 경우
        // "()"를 기점으로 분리되어 앞에 분리된 개수를 더해줌
        if paren[i-1] == "(" {
            stack.popLast()
            res += stack.count
        }
        // "))"의 경우
        // "))"를 기점으로 괄호 하나가 끝나므로 1을 더해줌
        else {
            stack.popLast()
            res += 1
        }
    }
}
print(res)
