//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  부품 찾기 (Set)

import Foundation

let n = Int(readLine()!)!
var remainPart = Set(readLine()!.split(separator: " ").map {Int($0)!})

let m = Int(readLine()!)!
var requestPart = readLine()!.split(separator: " ").map {Int($0)!}

for i in requestPart{
    if remainPart.contains(i){
        print("yes", terminator:" ")
    } else{
        print("no", terminator:" ")
    }
}
