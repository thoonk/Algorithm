//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/21.
//  위장 (해시)

import Foundation

var clothes = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]

var dailyClothes = [String:Int]()
    
for i in clothes {
    let key = i[1]
    let value = dailyClothes[key] ?? 1
    dailyClothes[key] = value + 1
}
// 아무것도 입지 않는 경우 제외
print(dailyClothes.reduce(1) {$0 * $1.value } - 1)
