//
//  Q1259-PalindromeNum.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/11/20.
//  팰린드롬수 구현

func isPalindrome(_ s: String) -> Bool {
    let arr = Array(s)
    let mid = s.count / 2
    for i in 0..<mid {
        if arr[i] != arr[s.count-1-i] {
            return false
        }
    }
    return true
}

while true {
    let s = readLine()!
    
    if Int(s)! == 0 {
        break
    }
    
    print(isPalindrome(s) ? "yes" : "no")
}
