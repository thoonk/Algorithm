//
//  Q1000.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/23.
//

import Foundation

var num = readLine()

if let num = num {
    var nums = num.components(separatedBy: " ")
    let sum = Int(nums[0])! + Int(nums[1])!
    print(sum)
}
