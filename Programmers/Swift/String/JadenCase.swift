//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/20.
//  JadenCase 문자열 만들기 Level2

import Foundation

func solution(_ s:String) -> String {
    
    var strings = s.map { $0.lowercased() }
    var result = ""
    var flag = true
    
    for c in strings {
        result += flag ? c.uppercased() : c
        flag = c == " " ? true : false
    }
    return result
}

print(solution("3people unFollowed me"))
