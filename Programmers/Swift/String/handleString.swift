//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/01.
//  문자열 다루기 기본 Level1

import Foundation

func solution(_ s:String) -> Bool {
    
    var ans = true
    if s.count == 4 || s.count == 6 {
        for c in s {
            if Int(String(c)) == nil {
                ans = false
            }
        }
    } else {
        ans = false
    }
    return ans
}
