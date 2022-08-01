//
//  Q7567-dishes.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/01.
//  그릇 / 구현, 문자열

let dishes = Array(readLine()!.map { String($0) })
var result = 10

for i in 1..<dishes.count {
    if dishes[i] == dishes[i - 1] {
        result += 5
    } else {
        result += 10
    }
}

print(result)
