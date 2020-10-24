//
//  Q2609.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/23.
//

import Foundation

var nums = readLine()!.split(separator: " ").map{Int($0)!}
var gcd: Int = getGCD(nums[0], nums[1])
var lcm: Int = getLCM(nums[0], nums[1])

print(gcd)
print(lcm)

func getGCD(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : getGCD(b, a % b)
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    return a * b / getGCD(a, b)
}

