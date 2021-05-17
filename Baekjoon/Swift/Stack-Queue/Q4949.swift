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
        if str == "(" || str == "[" {
            stack.append(String(str))
        } else if str == ")" {
            if !stack.isEmpty && stack.last == "(" {
                stack.popLast()
            } else {
                isPair = false
                break
            }
        } else if str == "]" {
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
