//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/05.
//  빗물 구현

func solution() {
    for i in stride(from: 1, to: w-1, by: 1) {
        var left = blocks[i]
        var right = blocks[i]
        
        for j in stride(from: i-1, to: -1, by: -1) {
            left = max(left, blocks[j])
        }
        
        for j in stride(from: i + 1, to: w, by: 1) {
            right = max(right, blocks[j])
        }
        
        let smaller = min(left, right)
        rainWater += smaller - blocks[i]
    }
    print(rainWater)
}

let hw = readLine()!.split(separator: " ").map { Int(String($0))! }
let h = hw[0]
let w = hw[1]
var blocks = readLine()!.split(separator: " ").map { Int(String($0))! }
var rainWater = 0
solution()
