//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/27.
//

import Foundation

var N = Int(readLine()!)!

var nums = readLine()!.split(separator: " ").map {Int($0)!}

for i in 1..<N{
    var result = getGCD(nums[0], nums[i])
    print("\(nums[0]/result)/\(nums[i]/result)")
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : getGCD(b, a % b)
}
