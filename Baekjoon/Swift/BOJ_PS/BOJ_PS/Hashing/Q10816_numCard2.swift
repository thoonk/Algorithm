//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/29.
//  10816 - 숫자 카드 2 Hashing

import Foundation

let n = Int(readLine()!)!
var numCard = readLine()!.split(separator: " ").map {Int($0)!}


let m = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map {Int($0)!}

var result = Array(repeating: 0, count: m)
var dict = [Int:Int]()

for i in numCard{
    let keys = dict.keys
    if keys.contains(i) {
        dict[i]! += 1
    } else{
        dict[i] = 1
    }
    
}

for i in arr {
    if dict.keys.contains(i){
        print(dict[i]!, terminator: " ")
    } else{
        print(0, terminator: " ")
    }
}
