//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/01.
//  나누어 떨어지는 숫자 배열

import Foundation

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    
    var result = arr.filter { $0 % divisor == 0 }
    result.sort()
    
    return result.isEmpty ? [-1] : result
}

print(solution([5,9,7,10], 5))
