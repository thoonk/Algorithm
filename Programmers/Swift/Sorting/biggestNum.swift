//
//  main.swift
//  Programmers_PS
//
//  Created by 김태훈 on 2020/11/23.
//  가장 큰 수 (정렬)

import Foundation

//var numbers = [6, 10, 2]
var numbers = [3, 30, 34, 5, 9]

func solution(_ numbers:[Int]) -> String {
    let sortedNums = numbers.sorted() { Int("\($0)\($1)")! > Int("\($1)\($0)")!}
    if sortedNums[0] == 0 {
        return "0"
    }
    return sortedNums.reduce("") {$0 + String($1)}
}

print(solution(numbers))
