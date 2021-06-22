//
//  Q10807.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/22.
//  개수 세기 / 구현

let n = Int(readLine()!)!
let nums = readLine()!
    .split(separator: " ")
    .map { Int(String($0))! }
let v = Int(readLine()!)!
let res = nums.filter { $0 == v }.count

print(res)

