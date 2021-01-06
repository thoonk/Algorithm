//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/06.
//  핸드폰 번호 가리기 Level1

import Foundation

func solution(_ phone_number:String) -> String {
    
    let replaced = String(repeating: "*", count: phone_number.count-4)
    
    return replaced + phone_number[phone_number.index(phone_number.endIndex, offsetBy: -4)...]
}

print(solution("01012341234"))
