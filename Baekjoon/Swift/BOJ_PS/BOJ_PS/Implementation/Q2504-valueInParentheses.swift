//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/01.
//  괄호의 값 스택, 구현

var parens = Array(readLine()!).map { String($0) }
var stack = [String]()
var result = 0
var isCorrect = true
var temp = 1

for i in parens.indices {
    
    if parens[i] == "(" {
        temp *= 2
        stack.append(parens[i])
    } else if parens[i] == "[" {
        temp *= 3
        stack.append(parens[i])
    } else if parens[i] == ")" {
        // 올바르지 못한 괄호의 경우
        if stack.isEmpty || stack.last != "(" {
            isCorrect = false
            break
        }
        // 올바른 경우 현재 계산된 값(temp)까지 result에 더해줌
        if parens[i-1] == "(" {
            result += temp
        }
        stack.removeLast()
        // 스택에서 뺀 만큼 현재 계산된 값 갱신
        temp /= 2
    } else if parens[i] == "]" {
        // 올바르지 못한 괄호의 경우
        if stack.isEmpty || stack.last != "[" {
            isCorrect = false
            break
        }
        // 올바른 경우 현재 계산된 값(temp)까지 result에 더해줌
        if parens[i-1] == "[" {
            result += temp
        }
        stack.removeLast()
        // 스택에서 뺀 만큼 현재 계산된 값 갱신
        temp /= 3
    }
}

if !isCorrect || !stack.isEmpty {
    print(0)
} else {
    print(result)
}

