//
//  Q2476-diceGame.swift
//  BOJ_PS
//
//  Created by thoonk on 2022/07/31.
//  주사위 게임 / 구현, 수학

var result = 0

for _ in 0..<Int(readLine()!)! {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    if nums[0] == nums[1]
        && nums[1] == nums[2]
        && nums[0] == nums[2] {
        result = max(result, 10000 + nums[0]  * 1000)
    } else if nums[0] == nums[1] {
        result = max(result, 1000 + nums[0] * 100)
    } else if nums[1] == nums[2] {
        result = max(result, 1000 + nums[1] * 100)
    } else if nums[0] == nums[2] {
        result = max(result, 1000 + nums[0] * 100)
    } else {
        result = max(result, nums.max()! * 100)
    }
}

print(result)
