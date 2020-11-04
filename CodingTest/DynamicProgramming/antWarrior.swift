//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/03.
//  개미 전사 (bottom-up DP)

import Foundation
// 창고의 개수 입력
let n = Int(readLine()!)!
// 창고의 식량의 양 입력
var nums = readLine()!.split(separator: " ").map {Int($0)!}
// DP 테이블
var d = Array(repeating: 0, count: 10001)

d[0] = nums[0]
d[1] = max(nums[0], nums[1])
// bottom-up DP 진행
for i in stride(from: 2, to: n, by: 1){
    d[i] = max(d[i-1], d[i-2] + nums[i])
}

print(d[n-1])

/*
 4
 1 3 1 5
 */
