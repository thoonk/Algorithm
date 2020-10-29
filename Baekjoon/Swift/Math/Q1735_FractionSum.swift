//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/26.
//

import Foundation

var first = readLine()!.split(separator: " ").map {Int($0)!}
var second = readLine()!.split(separator: " ").map {Int($0)!}

var result: [Int] = fractionSum(first, second)

for i in result{
    print(i, terminator: " ")
}

func fractionSum(_ first: [Int], _ second: [Int]) -> [Int]{
    
    var sum:[Int] = Array.init(repeating: 0, count: 2)
    
    let denominator: Int = getLCM(first[1], second[1])
    let moleculeOperator1: Int = denominator / first[1]
    let moleculeOperator2: Int = denominator / second[1]
    
    sum[0] = first[0] * moleculeOperator1 + second[0] * moleculeOperator2
    sum[1] = denominator
    
    let sumGCD = getGCD(sum[0], sum[1])
    
    // 기약 분수 만들기
    if sum[0] % sumGCD == 0, sum[1] % sumGCD == 0 {
        sum[0] /= sumGCD
        sum[1] /= sumGCD
    }
    
    return sum
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : getGCD(b, a % b)
}

func getLCM(_ a: Int, _ b: Int) -> Int {
    return a * b / getGCD(a, b)
}
