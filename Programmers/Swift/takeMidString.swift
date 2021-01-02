//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/29.
//  가운데 글자 가져오기 Level1

import Foundation


func solution(_ s:String) -> String {
    
    let length = s.count
    let str = Array(s).map {String($0)}
    var idx = 0
    
    if length % 2 == 0 {
        idx = length/2
        return str[idx-1...idx].joined()
    } else {
        idx = Int(ceil(Double(length/2)))
        return str[idx]
    }
}

print(solution("abcd"))
