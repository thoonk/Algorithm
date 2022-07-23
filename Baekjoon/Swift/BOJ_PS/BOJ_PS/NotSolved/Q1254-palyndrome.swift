//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/22.
//  1254 팰린드롬만들기

func isPalindrome(_ str: String) -> Bool {
    for i in 0 ..< str.count/2 {
        if str[str.index(str.startIndex, offsetBy: i)] !=
            str[str.index(s.startIndex, offsetBy: str.count-1-i)] {
            return false
        }
    }
    return true
}

let s = readLine()!
let sLen = s.count
let reversedS = String(s.reversed())
if isPalindrome(s) {
    print(sLen)
} else {
    for i in stride(from: sLen-1, to: 0, by: -1) {
        let range = reversedS.startIndex..<reversedS.index(s.startIndex, offsetBy: i)
        if isPalindrome(String(reversedS[range])) == true {
            print(sLen * 2 - 1)
            break
        }
    }
}



