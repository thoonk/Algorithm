//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/01.
//  계수 정렬

import Foundation

var array = [7, 5, 9, 0, 3, 1, 6, 2, 9, 1, 4, 8, 0, 5, 2]

// array의 최댓값 + 1 크기의 배열 초기화
var cnt = Array(repeating: 0, count: array.max()! + 1)

for i in stride(from: 0, to: array.count, by: 1){
    cnt[array[i]] += 1
}

// cnt에 저장되어 있는 수만큼 반복해서 출력
for i in stride(from: 0, to: cnt.count, by: 1){
    for _ in stride(from: 0, to: cnt[i], by: 1){
        print(i, terminator:" ")
    }
}
