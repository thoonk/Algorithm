//
//  Q5355-MarsMath.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/30.
//  화성 수학 / 수학

import Foundation

for _ in 0..<Int(readLine()!)! {
    let expressions = readLine()!.split(separator: " ").map { String($0) }
    
    var num = Double(expressions[0])!
    
    for i in 1..<expressions.count {
        if expressions[i] == "@" {
            num *= 3
        } else if expressions[i] == "%" {
            num += 5
        } else if expressions[i] == "#" {
            num -= 7
        }
    }
    
    print(String(format: "%.2f", num))
}

