//
//  Q2935-noise.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/31.
//

let a = readLine()!.count
let oper = readLine()!
let b = readLine()!.count

var result: String = "1"

if oper == "*" {
    result += String(repeating: "0", count: a - 1)  + String(repeating: "0", count: b - 1)
} else {
    if a > b{
        result += String(repeating: "0", count: a - b - 1) + "1" + String(repeating: "0", count: b - 1)
    } else if a < b {
        result += String(repeating: "0", count: b -  a - 1) + "1" + String(repeating: "0", count: a - 1)
    } else {
        result = "2" + String(repeating: "0", count: a - 1)
    }
}

print(result)

