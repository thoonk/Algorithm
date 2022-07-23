//
//  Q4949.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/17.
//  균형잡힌 세상 / 스택

while let input = readLine() {
    if input == "." {
        break
    }
    
    var stack = [String]()
    var isPair = true
    
    for str in input {
        // "(" 또는 "["가 나오면 스택에 추가
        if str == "(" || str == "[" {
            stack.append(String(str))
        }
        // ")"일 때
        else if str == ")" {
            // 스택이 비어있지 않고 스택의 top이 "("이라면 꺼내기
            if !stack.isEmpty && stack.last == "(" {
                stack.popLast()
            } else {
                isPair = false
                break
            }
        }
        // "]"일 때
        else if str == "]" {
            // 스택이 비어있지 않고 스택의 top이 "["이라면 꺼내기
            if !stack.isEmpty && stack.last == "[" {
                stack.popLast()
            } else {
                isPair = false
                break
            }
        }
    }
    
    print(stack.isEmpty && isPair == true ? "yes" : "no")
}
