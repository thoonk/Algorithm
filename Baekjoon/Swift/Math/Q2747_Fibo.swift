//
//  Main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/23.
//

import Foundation

var num = Int(readLine()!)!

print(fiboRecur(num))
print(fiboRepeat(num))

// 재귀의 경우 시간 초과 O(2^n)
func fiboRecur(_ n: Int) -> Int {
    if n >= 2{
        return fiboRecur(n - 1) + fiboRecur(n - 2)
    } else {
        return n
    }
}

// 반복의 경우 O(n)
func fiboRepeat(_ n: Int) -> Int {
    var a = 0
    var b = 1
    var c = 0
    
    guard n >= 2 else { return n }
    
    for _ in 2..<n{
        c = a + b
        a = b
        b = c
    }
    return a + b
}

