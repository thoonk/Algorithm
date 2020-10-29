//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/26.
//

import Foundation

let N = Int(readLine()!)!
var result = 0
var i = 1

while i <= N {
    
   result += (N-i+1)
   i *= 10
}
print(result)
