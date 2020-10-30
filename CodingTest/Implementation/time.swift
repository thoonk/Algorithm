//
//  time.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/29.
//  시각: 정수 N 입력되면 00시 00분 00초부터 N시 59분 59초까지의 모든 시각 중에서 3이 하나로도 포함되는 모든 경우의 수 구하기

import Foundation

let N = Int(readLine()!)!

var cnt = 0

for i in stride(from: 0, through: N, by: 1){
    for j in stride(from: 0, to: 60, by: 1){
        for k in stride(from: 0, to: 60, by: 1){
            let time = String(i) + String(j) + String(k)
            if  time.contains("3") {
                cnt += 1
            }
        }
    }
}

print(cnt)
