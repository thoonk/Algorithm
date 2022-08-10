//
//  Q10988-checkPalindrome.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/08/10.
//  팰린드롬인지 확인하기 / 구현

let input = Array(readLine()!.map { String($0) })
var isPalindrome = true

for i in 0..<input.count/2 {
    if input[i] != input[input.count - i - 1] {
        isPalindrome = false
    }
}

print(isPalindrome ? 1 : 0)
