//
//  Q10156-snack.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/31.
//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let k = input[0]
let n = input[1]
let m = input[2]

let result = k * n - m
print(result >= 0 ? result : 0)
