//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/03.
//  1로 만들기 (bottom-up DP)

import Foundation

let x = Int(readLine()!)!
// DP 테이블 생성
var d = Array(repeating: 0, count: 10001)

for i in stride(from: 2, to: x+1, by: 1){
    // 1을 빼는 경우
    d[i] = d[i-1] + 1
    // 5로 나눠질 경우 1뺀거랑 비교해서 작은 값 저장
    if d[i] % 5 == 0 {
        d[i] = min(d[i], d[i/5]+1) // +1은 함수의 호출 횟수를 구하는 것이기 때문
    }
    // 3으로 나눠질 경우 1뺀거랑 비교해서 작은 값 저장
    else if d[i] % 3 == 0{
        d[i] = min(d[i], d[i/3]+1)
    }
    // 2로 나눠질 경우 1뺀거랑 비교해서 작은 값 저장
    else if d[i] % 2 == 0{
        d[i] = min(d[i], d[i/2]+1)
    }
}
print(d[x])

// 26
