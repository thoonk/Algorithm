//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/05.
//  제일 작은 수 제거하기 Level1

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    
    let minNum = arr.min()!
    let arr = arr.filter() { $0 > minNum}
    return arr.isEmpty ? [-1] : arr
}

print(solution([4,3,2,1]))
