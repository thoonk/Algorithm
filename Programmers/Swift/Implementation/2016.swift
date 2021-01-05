//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2020/12/28.
//  2016 Level1

import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    
    let week = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    let month = [31,29,31,30,31,30,31,31,30,31,30,31]
    
    var day = month[0..<a-1].reduce(0,+) + b+4
    
    return week[day%7]
}

print(solution(5, 24))
