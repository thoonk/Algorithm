//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/28.
//

import Foundation

var nums = readLine()!.split(separator: " ").map { Int($0)!}

var n = nums[0]
var cnt = 0

while true {
    
    if n == 1{
        break;
    }
    
    if n % nums[1] == 0 {
        n /= nums[1]
        cnt += 1
    } else {
        n -= 1
        cnt += 1
    }
}
print(cnt)

