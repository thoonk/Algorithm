//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/04.
//  이상한 문자 만들기 Level1

import Foundation

var nums = readLine()!.components(separatedBy: " ").map {Int($0)!}
print(nums)

func solution(_ s:String) -> String {
    var result = [String]()
    let s = s.components(separatedBy: " ")
    
    for i in s {
        var temp = ""
        for (j, k) in i.enumerated() {
            if j%2 == 0 {
                temp += k.uppercased()
            } else  {
                temp += k.lowercased()
            }
        }
        result.append(temp)
    }
    return result.joined(separator: " ")
}
print(solution("try hello world"))

