//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/28.
//

import Foundation

let nums = readLine()!.split(separator: " ").map {Int($0)!}
var data = readLine()!.split(separator: " ").map {Int($0)!}

data.sort()

let k = nums[2]
var m = nums[1]
var result = 0

let max1 = data[nums[0] - 1]
let max2 = data[nums[0] - 2]

var count = Int(m / (k + 1) * k)
count += m % (k+1)

result += (count) * max1
result += (m - count) * max2

print(result)
