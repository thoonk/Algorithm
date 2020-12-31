//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/29.
//  문자열 내림차순 정렬

import Foundation

func solution(_ s:String) -> String {
    
    var str = Array(s).map {String($0)}
    str.sort(by: >)
    
    return str.joined()
}

print(solution("Zbcdefg"))
