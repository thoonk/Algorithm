//
//  main.swift
//  Programmers
//
//  Created by 김태훈 on 2021/01/17.
//  최댓값과 최솟값 Level2

import Foundation

func solution(_ s:String) -> String {
    var nums = s.components(separatedBy: " ").map {Int($0)!}
    return "\(nums.min()!) \(nums.max()!)"
}

print(solution("1 2 3 4"))
print(solution("-1 -2 -3 -4"))
