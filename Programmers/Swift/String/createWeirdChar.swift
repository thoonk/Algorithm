//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/04.
//  이상한 문자 만들기 Level1

import Foundation

func solution(_ s:String) -> String {
    var res = [String]()
    let arr = s.split(separator: " ", omittingEmptySubsequences: false).map { String($0) }
    // let arr = s.components(separatedBy: " ")
    for str in arr {
        var temp = ""
        for (j, c) in str.enumerated() {
            temp.append(j % 2 == 0 ? c.uppercased() : c.lowercased())
        }
        res.append(temp)
    }
    return res.joined(separator: " ")
}

print(solution("try hello  world"))
