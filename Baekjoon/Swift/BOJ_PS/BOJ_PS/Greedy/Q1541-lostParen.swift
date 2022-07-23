//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/13.
//  Q1541 잃어버린 괄호 그리디

import Foundation

var formula = readLine()!.split(separator: "-").map {String($0)}
let first = formula[0].split(separator: "+").map {Int(String($0))!}
var result = 0

for i in first {
    result += i
}

var temp = 0

for i in 1 ..< formula.count {
    let minus = formula[i].split(separator: "+").map {Int(String($0))!}
    for j in minus {
        temp += j
    }
}

print(result-temp)

