//
//  Q2493.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/13.
//  탑 / 스택

typealias Tower = (index: Int, height: Int)

let n = Int(readLine()!)!
var towers = readLine()!.split(separator: " ").map { Int(String($0))! }

func solution() {
    // 수신 탑 인덱스 배열
    var res = [Int]()
    // 탑 인덱스와 높이
    var stack = [Tower]()

    for i in 0 ..< n {
        while !stack.isEmpty {
            // 스택의 top이 현재 인덱스가 가리키는 타워보다 크다면 수신이 가능하여 index 추가
            if stack.last!.height > towers[i] {
                res.append(stack.last!.index + 1)
                break
            } else {
                stack.popLast()
            }
        }
        // 스택이 비어있을 때 레이저 신호 수신할 탑이 없으니 0 추가
        if stack.isEmpty {
            res.append(0)
        }
        stack.append((i, towers[i]))
    }
    
    print(res.map { String($0) }.joined(separator: " "))
}
solution()
