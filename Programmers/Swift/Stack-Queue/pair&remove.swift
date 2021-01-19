//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/19.
//  짝지어 제거하기 Level2

import Foundation

func solution(_ s:String) -> Int{
    var temp = [Character]()
    s.forEach {
        let lastIdx = temp.count-1
        if temp.count == 0 || temp[lastIdx] != $0 {
            temp.append($0)
        } else if temp[lastIdx] == $0 {
            temp.removeLast()
        }
    }

    return temp.isEmpty ? 1 : 0
}
print(solution("baabaa"))
print(solution("cdcd"))
