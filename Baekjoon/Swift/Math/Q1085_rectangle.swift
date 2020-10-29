//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/23.
//

import Foundation

var nums = readLine()!.split(separator: " ").map { Int($0)!}
print(getMin(nums))

func getMin(_ n: [Int]) -> Int{
    
    var x = n[2] - n[0]
    var y = n[3] - n[1]
    
    return min(x, y, n[0], n[1])
}
