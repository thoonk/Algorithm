//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/15.
//  올바른 괄호 Level2

import Foundation

func solution(_ s:String) -> Bool
{
    var cnt = 0
    
    for c in s {
        if c == "(" {
            cnt += 1
        } else {
            if cnt == 0 {
                return false
            } else {
                cnt -= 1
            }
        }
    }
    
    return cnt == 0 ? true : false
}

print(solution("(())()"))
