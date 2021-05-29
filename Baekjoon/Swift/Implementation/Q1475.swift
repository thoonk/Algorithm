//
//  Q1475.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/29.
//  방 번호 / 구현

import Foundation

let nums = Array(readLine()!).map { Int(String($0))! }
var res = nums.count
var cnt = [Double](repeating: 0, count: 9)

for n in nums {
    if n == 6 || n == 9 {
        cnt[6] += 0.5
    } else {
        cnt[n] += 1
    }
}

print(Int(round(cnt.max()!)))
