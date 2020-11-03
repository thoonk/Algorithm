//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  부품 찾기(계수 정렬)

import Foundation


let n = Int(readLine()!)!
var remainPart = readLine()!.split(separator: " ").map {Int($0)!}
var array = Array(repeating: 0, count: 1000001)
for i in remainPart{
    array[i] = 1
}

let m = Int(readLine()!)!
var requestPart = readLine()!.split(separator: " ").map {Int($0)!}

for i in requestPart{
    if array[i] == 1 {
        print("yes", terminator:" ")
    } else{
        print("no", terminator:" ")
    }
}

