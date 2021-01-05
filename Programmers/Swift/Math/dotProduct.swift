//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/04.
//  내적 Level1

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var result = 0
    
    for i in 0..<a.count {
        result += a[i] * b[i]
    }
    
    return result
}
