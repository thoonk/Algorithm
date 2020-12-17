//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/17.
//  Q2437 저울 그리디

import Foundation

let n = Int(readLine()!)!
var weight = readLine()!.split(separator: " ").map {Int(String($0))!}
weight.sort()

if weight.first != 1 {
    print("1")
} else {
    var sum = 1
    
    for i in 1 ..< n {
        if weight[i] > sum+1 {
            break
        }
        sum += weight[i]
    }
    print(sum+1)
}
