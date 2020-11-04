//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/03.
//  바닥 공사 (bottom-up DP)

import Foundation

// 2 X n 타일 크기 입력
let n = Int(readLine()!)!
// DP 테이블 생성
var d = Array(repeating: 0, count: 10001)

d[1] = 1
d[2] = 3
// bottom-up DP 진행
for i in stride(from: 3, to: n+1, by: 1){
    d[i] = (d[i-1] + d[i-2] * 2) % 796796 // 결과값이 굉장히 커질 수 있는 것 방지
}

print(d[n])
