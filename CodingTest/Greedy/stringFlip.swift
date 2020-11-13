//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/13.
//  문자열 뒤집기 (그리디)

import Foundation

func solution() {
    
    var s = Array(readLine()!).map {Int(String($0))!}
    
    var cnt0 = 0
    var cnt1 = 0
    
    if s[0] == 0{
        cnt1 += 1
    } else {
        cnt0 += 1
    }
    
    for i in stride(from: 0, to: s.count-1, by: 1){
        if s[i] != s[i+1] {
            if s[i+1] == 0 {
                cnt1 += 1
            }
            else {
                cnt0 += 1
            }
        }
    }
    
    print(min(cnt0, cnt1))
}
solution()
