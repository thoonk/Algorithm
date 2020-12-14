//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/10.
//  Q11399 ATM 그리디

import Foundation

let n = Int(readLine()!)!

var p = readLine()!.split(separator: " ").map {Int(String($0))!}
p.sort()

var temp = 0
var result = 0

for i in p {
    temp += i
    result += temp
}
print(result)
