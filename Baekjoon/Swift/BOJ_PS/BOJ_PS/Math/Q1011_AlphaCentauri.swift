//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/24.
//  Fly me to the Alpha Centauri 

import Foundation

var T = Int(readLine()!)!

for _ in 0 ..< T{
    let nums = readLine()!.split(separator: " ").map { Int($0)!}
    
    let distance = nums[1] - nums[0]
    let result = computeDistance(distance)
    print(result)
}


func computeDistance (_ d: Int) -> Int{
    
    var cnt = 0
    let max = Int(sqrt(Double(d)))
    let powMax: Int = max * max
    
    if d == powMax {
        cnt = 2 * max - 1
    } else if powMax < d, d <= powMax + max{
        cnt = 2 * max
    } else if powMax + max < d, d < (max + 1) * (max + 1) {
        cnt = 2 * max + 1
    }
    
    return cnt
}
