//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/06.
//  콜라츠 추측 Level1

import Foundation

func solution(_ num:Int) -> Int {
    
    var cnt = 0
    var n = num
    
    while n != 1 {
        
        if cnt >= 500 {
            return -1
        }
        
        if n%2==0 {
            n = n/2
            cnt += 1
        } else {
            n = n*3+1
            cnt += 1
        }
    }
    
    return cnt
}

print(solution(6))
