//
//  Q1789-sumOfNumbers.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/26.
//

import Foundation

let s = Int(readLine()!)!
var result = 0
var n = 0

for i in 1..<s+1 {
    n += i
    result += 1
    
    if n > s {
        result -= 1
        break
    }
}

print(result)
