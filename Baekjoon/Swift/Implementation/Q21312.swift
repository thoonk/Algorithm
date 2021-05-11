//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/11.
//  홀짝 칵테일 / 구현

let beverage = readLine()!.split(separator: " ").map { Int(String($0))! }
var isOdd = false
var res = 1

func solution() {
    for i in beverage.indices {
        if beverage[i] % 2 == 1 {
            res *= beverage[i]
            isOdd = true
        }
    }
    
    print(isOdd == true ? res : beverage.reduce(1,*))
}

solution()
