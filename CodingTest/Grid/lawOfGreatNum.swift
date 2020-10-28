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

let cnt = nums[2]
var iter = nums[1]
var result = 0

let max1 = data[nums[0] - 1]
let max2 = data[nums[0] - 2]

while true {
    
    
    for _ in stride(from: 0, to: cnt, by: 1){
        if iter == 0{
            break;
        }
        result += max1
        iter -= 1
    }
    
    if iter == 0{
        break;
    }
    
    result += max2
    iter -= 1

}

print(result)
