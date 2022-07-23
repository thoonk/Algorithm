//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/23.
//  팰린드롬 만들기 브루트포스

import Foundation

func isPalindrome(_ index: Int) -> Bool {
    let arr = Array(s)
    let mid = (sLen - index) / 2
    for i in 0 ..< mid {
        if arr[index + i] != arr[sLen-1-i] {
            return false
        }
    }
    return true
}

let s = readLine()!
let sLen = s.count

for i in 0 ..< sLen {
    if isPalindrome(i) == true {
        print(sLen+i)
        break
    }
}



