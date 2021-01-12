//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/10.
//  [1차] 다트게임 카카오 Level1

import Foundation

func solution(_ dartResult:String) -> Int {
    
    var stack = [Int]()
    var temp = ""
    
    for i in dartResult {
        let lastIdx = stack.endIndex-1
        switch i {
        case "S":
            stack.append(Int(String(temp))!)
            temp = ""
        case "D":
            stack.append(Int(pow(Double(String(temp))!, 2.0)))
            temp = ""
        case "T":
            stack.append(Int(pow(Double(String(temp))!, 3.0)))
            temp = ""
        case "*":
            if lastIdx > 0 {
                stack[lastIdx-1] = stack[lastIdx-1] * 2
            }
            stack[lastIdx] = stack[lastIdx] * 2
        case "#":
            stack[lastIdx] = stack[lastIdx] * -1
        default:
            temp.append(i)
        }
    }
    
    return stack.reduce(0,+)
}

print(solution("1D#2S*3S"))
