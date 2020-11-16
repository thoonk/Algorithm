//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/11/12.
//  Q15829 hashing

import Foundation

func solution(){
    let n = Int(readLine()!)!
    let alphabet = Array(readLine()!).map { String($0)}
    var result: Int = 0
    
    for i in stride(from: 0, to: n, by: 1) {
        result += (Int(Character(alphabet[i]).asciiValue!) % 32) * Int(pow(31.0, Double(i)))
    }
    print(result % 1234567891)
}
solution()
