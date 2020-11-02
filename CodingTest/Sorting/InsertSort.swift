//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/01.
//  삽입 정렬

import Foundation

var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

// 2번째 데이터부터 시작
for i in stride(from: 1, to: array.count, by: 1){
    for j in stride(from: i, to: 0, by: -1){
        if array[j] < array[j-1] {
            array.swapAt(j, j-1)
        } else {
            break
        }
    }
}
print(array)
