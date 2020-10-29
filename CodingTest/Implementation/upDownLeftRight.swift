//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/28.
//

import Foundation

let N = Int(readLine()!)!

let direction = readLine()!.split(separator: " ")
var current: [Int] = [1, 1]


for i in direction{
    switch(i){
    case "L":
        if current[1] > 1{
            current[1] -= 1
        }
    case "R":
        if current[1] < N {
            current[1] += 1
        }
    case "U":
        if current[0] > 1{
            current[0] -= 1
        }
    case "D":
        if current[0] < N {
            current[0] += 1
        }
    default:
        print("다른 값 입력")
    }
}

print(current)
