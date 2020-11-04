//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/03.
//

import Foundation

// DP 테이블
var d = Array(repeating: 0, count: 100)

d[1] = 1
d[2] = 1
var n = 66

for i in stride(from: 3, to: n+1, by: 1){
    d[i] = d[i-1] + d[i-2]
}
print(d[n])
