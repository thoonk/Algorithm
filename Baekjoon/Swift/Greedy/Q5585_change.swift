//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/27.
//

import Foundation

var N = Int(readLine()!)!

var cnt = 0
var remain = 1000 - N

let coin_types = [500, 100, 50, 10, 5, 1]

for coin in coin_types{
    cnt += remain / coin
    remain %= coin
}

print(cnt)
