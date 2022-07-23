//
//  Q5525-IOIOI.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/06/09.
//  IOIOI 문자열

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = readLine()!.map { String($0) }

var cnt = 0
var result = 0
var i = 1

while i < m - 1 {
    if s[i-1...i+1].joined() == "IOI" {
        cnt += 1
        if cnt == n {
            result += 1
            cnt -= 1
        }
        i += 1
    } else {
        cnt = 0
    }
    i += 1
}

print(result)
