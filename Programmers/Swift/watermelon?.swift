//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/02.
//  수박수박수박수박수박수? Level1

import Foundation

func solution(_ n:Int) -> String {
    var ans = ""
    if n%2 == 0 {
        for _ in 0..<n/2 {
            ans += "수박"
        }
        return ans
    } else {
        for _ in 0..<n/2 {
            ans += "수박"
        }
        ans += "수"
        return ans
    }
}

print(solution(3))
