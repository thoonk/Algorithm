//
//  Q2163-cutChocolate.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/27.
//

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = nm[0]
let m = nm[1]

print((n - 1) + n * (m - 1))
