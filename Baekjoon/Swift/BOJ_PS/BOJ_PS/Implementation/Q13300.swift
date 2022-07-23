//
//  Q13300.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/23.
//  방 배정 / 구현
//  같은 성별끼리, 한방에 같은 학년, 한방에 한명도 가능

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var students = [[Int]](repeating: [Int](repeating: 0, count: 6), count: 2)

for _ in 0 ..< n {
    let sy = readLine()!.split(separator: " ").map { Int(String($0))! }
    students[sy[0]][sy[1]-1] += 1
}

var res = 0
for student in students {
    for i in student {
        res += Int(ceil(Double(i)/Double(k)))
    }
}
print(res)
