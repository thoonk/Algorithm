//
//  Q4889.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/21.
//  안정적인 문자열 / 스택, 문자열, 그리디

var index = 0
while true {
    let data = Array(readLine()!)
    if data.first == "-" {
        break
    }
    var stack = [Character]()
    var cnt = 0
    for d in data {
        if d == "{" {
            stack.append(d)
        }
        // d == "}"일 때
        else {
            // 스택이 비어있으면 "}" -> "{"로 바꾸고 연산 횟수 증가시킴
            if stack.isEmpty {
                stack.append("{")
                cnt += 1
            }
            // 스택이 비어있지 않으면 "{"와 "}" 순서니 안정적이므로 pop
            else {
                stack.popLast()
            }
        }
    }
    index += 1
    // 처리 후 스택에 남아있는 개수의 절반이 곧 연산 횟수
    // why? "{" -> "}" 처리하는 연산을 하지 않았고 만약 스택에 "{{{{"가 남아 있을 때 2번만 바꿔주면 안정적인 배열이 됨
    print("\(index). \(cnt + stack.count / 2)")
}
