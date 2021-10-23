//
//  Q3986.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/10/23.
//  좋은 단어 / 스택

let n = Int(readLine()!)!
var cnt = 0

for _ in 0..<n {
    var stack = [Character]()
    let words = String(readLine()!)
    
    for word in words {
        if !stack.isEmpty {
            if stack.last == word {
                stack.removeLast()
            } else {
                stack.append(word)
            }
        } else {
            stack.append(word)
        }
    }
    
    if stack.isEmpty {
        cnt += 1
    }
}

print(cnt)
