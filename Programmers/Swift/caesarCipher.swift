//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/04.
//  시저 암호

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    
    var result = ""
    
    for char in s {
        if char == " " {
            result += String(char)
        } else {
            var temp = Int(char.asciiValue!)
            for _ in 0..<n {
                temp += 1
                if temp > 90, temp < 97 {
                    temp = 65
                } else if temp > 122, temp < 128 {
                    temp = 97
                }
            }
            result += String(UnicodeScalar(temp)!)
        }
    }
    
    return result
}

print(solution("a B z", 4))
