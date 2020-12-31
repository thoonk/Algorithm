//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/29.
//  문자열 내 마음대로 정렬하기

import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    
    var strs = strings
    
    strs.sort(by: {(s1, s2) -> Bool in
        if s1[s1.index(s1.startIndex, offsetBy: n)] == s2[s2.index(s2.startIndex, offsetBy: n)] {
            return s1 < s2
        }
        return s1[s1.index(s1.startIndex, offsetBy: n)] < s2[s2.index(s2.startIndex, offsetBy: n)]
    })
    
    return strs
}

print(solution(["sun", "bed", "car"], 1))
