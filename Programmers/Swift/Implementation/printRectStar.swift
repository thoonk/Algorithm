//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/08.
//  직사각형 별찍기 Level1

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])

for _ in 0..<b {
    for _ in 0..<a {
        print("*", terminator:"")
    }
    print("")
}
