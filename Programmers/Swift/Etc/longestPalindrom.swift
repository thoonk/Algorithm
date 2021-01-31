//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/31.
//  가장 긴 팰린드롬 Level3

import Foundation

func solution(_ s:String) -> Int {
    
    let arr = Array(s)
    let len = arr.count
    var cnt = 0
    
    for i in 0..<len {
        for j in stride(from: len-i, to: cnt, by: -1) {
            var left = i
            var right = i+j-1
            while left <= right, arr[left] == arr[right] {
                left += 1
                right -= 1
            }
            if left > right {
                cnt = max(cnt, j)
            }
        }
    }
        
    return cnt
}

print(solution("abcdcba"))
