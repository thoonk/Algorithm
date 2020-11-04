//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/04.
//  효율적인 화폐구성 (bottom-up DP)

import Foundation

// n: 화폐들의 개수, 금액
let nm = readLine()!.split(separator: " ").map {Int($0)!}
var n = nm[0]
var m = nm[1]

var monetoryUnit = [Int]()
// 화폐 단위 입력
for i in stride(from: 0, to: n, by: 1){
    monetoryUnit.append(Int(readLine()!)!)
}
// DP 테이블 생성
var d = Array(repeating: 10001, count: m+1)

d[0] = 0
// bottom-up DP 진행
for i in stride(from: 0, to: n, by: 1){
    for j in stride(from: monetoryUnit[i], to: m+1, by: 1){
        if d[j-monetoryUnit[i]] != 10001{ // (i-k)원을 만드는 방법이 존재하는 경우
            d[j] = min(d[j], d[j-monetoryUnit[i]] + 1)
        }
    }
}

if d[m] == 10001{
    print(-1)
} else{
    print(d[m])
}

/*
 2 15
 2
 3
 */
