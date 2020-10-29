//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/25.
//

import Foundation

var n = Int(readLine()!)!

for i in stride(from: 2, through: Int(sqrt(Double(n))), by: 1){
    while n%i == 0 {
        print(i)
        n /= i
    }
}

if n > 1 {
    print(n)
}
    

