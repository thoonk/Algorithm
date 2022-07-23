//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/29.
//

import Foundation

let nums = readLine()!.split(separator: " ").map {Int($0)!}
var coinTypes = [Int]()
var cnt = 0
var money = nums[1]

for _ in stride(from: 0, to: nums[0], by: 1){
    let coin = Int(readLine()!)!
    coinTypes.append(coin)
}

coinTypes = Array(coinTypes.reversed())

for coin in coinTypes{
    cnt += money / coin
    money %= coin
}

print(cnt)
