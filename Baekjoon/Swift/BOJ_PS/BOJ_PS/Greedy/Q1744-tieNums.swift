//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/14.
//  Q1744 수 묶기 그리디

import Foundation

let n = Int(readLine()!)!
var zero = 0
var one = 0
var plus = [Int]()
var minus = [Int]()

for _ in 0 ..< n {
    let a = Int(readLine()!)!
    if a == 0 {
        zero += 1
    } else if a == 1 {
        one += 1
    } else if a < 0 {
        minus.append(a)
    } else {
        plus.append(a)
    }
}
plus.sort(by: >)
minus.sort()
var sum = one


while plus.count >= 2 {
    sum += plus[0]*plus[1]
    plus.removeFirst()
    plus.removeFirst()
}
if plus.count == 1 {
    sum += plus[0]
}

while minus.count >= 2 {
    sum += minus[0]*minus[1]
    minus.removeFirst()
    minus.removeFirst()
}
if minus.count == 1 {
    if zero == 0 {
        sum += minus[0]
    }
}

print(sum)
