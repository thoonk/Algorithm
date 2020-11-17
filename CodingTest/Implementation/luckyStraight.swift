//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/15.
//  럭키스트레이트 (구현)

import Foundation


func solution() {
    let nums = Array(readLine()!).map {Int(String($0))!}
    let mid: Int = nums.count / 2
    
    var midSum = 0
    for i in stride(from: 0, to: mid, by: 1) {
        midSum += nums[i]
    }

    if nums.reduce(0, +) - (midSum * 2) == 0{
        print("LUCKY")
    } else{
        print("READY")
    }
}

solution()

