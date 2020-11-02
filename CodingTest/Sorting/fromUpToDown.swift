//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  위에서 아래로

import Foundation

let N = Int(readLine()!)!
var nums = [Int]()

for _ in stride(from: 0, to: N, by: 1){
    nums.append(Int(readLine()!)!)
}
// 내림차순 정렬
nums = nums.sorted(by: >)

for i in nums{
    print(i, terminator: " ")
}
