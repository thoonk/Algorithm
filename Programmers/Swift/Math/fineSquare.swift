//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/13.
//  멀쩡한 사각형 Level2

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    return Int64(w*h - (w+h-getGCD(w,h)))
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : getGCD(b, a%b)
}

print(solution(12, 8))
