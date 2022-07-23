//
//  Q1026.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/31.
//  보물 / 그리드
//  B에 있는 수를 재배열하면 안 되는 규칙이 있어 A의 최소 값과 B의 최대 값을
//  곱하여 값을 res에 누적한다. 그리고 배열에서 index를 찾아 삭제한다.
var n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
var b = readLine()!.split(separator: " ").map { Int(String($0))! }
var res = 0

a.sort()

while n > 0 {
    let minA = a.min()!
    let maxB = b.max()!
    res += minA * maxB
    
    a.remove(at: a.firstIndex(of: minA)!)
    b.remove(at: b.firstIndex(of: maxB)!)
    n -= 1
}

print(res)
