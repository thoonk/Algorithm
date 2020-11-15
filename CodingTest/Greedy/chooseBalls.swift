//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/15.
//  볼링공 고르기 (그리디)

import Foundation

func solution() {
    
    let nm = readLine()!.split(separator: " ").map {Int($0)!}
    var n = nm[0]
    let m = nm[1]
    
    let balls = readLine()!.split(separator: " ").map {Int($0)!}
    var array = Array(repeating: 0, count: 11)
    
    for i in balls{
         array[i] += 1
    }
    
    var result = 0
    for i in stride(from: 1, to: m+1, by: 1){
        // A가 선택할 수 있는 볼링공 개수 제외
        n -= array[i]
        // B가 선택 가능한 수와 곱하기
        result += array[i] * n
    }
    print(result)
}
solution()
