//
//  Q2407-combination(BInt).swift
//  BOJ_PS
//
//  Created by thoonk on 2022/02/14.
//  조합

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
// 19자리
var max: UInt64 = 1000000000000000000

var left = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)
var right = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)

right[1][0] = 1
right[1][1] = 1

for i in 2...n {
    right[i][0] = 1
    right[i][i] = 1
    
    for j in 1..<i {
        right[i][j] = right[i - 1][j - 1] + right[i - 1][j]
        left[i][j] = left[i - 1][j - 1] + left[i - 1][j]
        
        if right[i][j] >= max {
            right[i][j] -= max
            left[i][j] += 1
        }
    }
}

if left[n][m] > 0 {
    print("\(left[n][m])\(right[n][m])")
} else {
    print("\(right[n][m])")
}
