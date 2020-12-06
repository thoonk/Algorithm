//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/11/27.
//  조이스틱 (구현) 마저 풀어야 함

import Foundation


func solution(_ name:String) -> Int {
    let str = Array(name)
    let len = str.count
    var alphaCnt = 0
    var moveCnt = 0
    var leftCursor = 0
    var rightCursor = 0
    var left = 1
    var right = 0

    // 알파벳 조작 횟수
    for char in str {
        var num = Int(char.asciiValue!) - 65
        
        if num > 13 {
            num = 26 - num
        }
        alphaCnt += num
    }
    print(alphaCnt)
        
    for i in stride(from: 0, to: len, by: 1) {
        var next = 0
        if str[i] != "A" {
            next = i - rightCursor
            right += next
            rightCursor = i
        }
    }
    print("right: \(right)")
    for i in stride(from: len - 1, through: 0, by: -1){
        var next = 0
        if str[i] != "A" {
            next = i - leftCursor
            left += next
            leftCursor = i
        }
    }
    print("left: \(left)")
    
    moveCnt = min(left, right)
    print(moveCnt)

    return alphaCnt+moveCnt
}

print(solution("BBBAAAB"))


