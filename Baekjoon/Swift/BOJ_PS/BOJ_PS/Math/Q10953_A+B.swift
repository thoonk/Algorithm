//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/23.
//

import Foundation


var num = Int(readLine()!)!

for i in 0 ..< num {
    var nums = readLine()!.split(separator: ",").map {Int($0)!}
    var sum = nums[0] + nums[1]
    print(sum)
}
