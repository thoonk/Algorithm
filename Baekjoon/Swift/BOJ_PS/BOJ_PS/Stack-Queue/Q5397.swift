//
//  Q5397.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/17.
//  키로거 / 스택

for _ in 0 ..< Int(readLine()!)! {
    var left = [String]()
    var right = [String]()
    let l = Array(readLine()!)
    for str in l {
        if str == "<" {
            if !left.isEmpty {
                right.append(left.removeLast())
            }
        } else if str == ">" {
            if !right.isEmpty {
                left.append(right.removeLast())
            }
        } else if str == "-" {
            left.popLast()
        } else {
            left.append(String(str))
        }
    }
    print((left + right.reversed()).joined())
}


