//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/23.
//  게임 이분탐색

import Foundation

let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
let x = xy[0]
let y = xy[1]

solution()

func solution() {
    var start = 0
    var end = 1000000000
    let z =  (y * 100 / x) + 1
    var result = 0
    
    if z >= 99 {
        print(-1)
        return
    }
    
    while start <= end {
        let mid = (start + end) / 2
        let temp = (y + mid) * 100 / (x + mid)

        if temp >= z {
            end = mid - 1
            result = mid
        } else {
            start = mid + 1
        }
    }
    print(result)
}
