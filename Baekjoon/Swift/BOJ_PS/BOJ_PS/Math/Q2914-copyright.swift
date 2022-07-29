//
//  Q2914-copyright.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/29.
//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = input[0]
let i = input[1]

print(a * (i - 1) + 1)
