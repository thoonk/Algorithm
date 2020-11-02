//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/01.
//  선택 정렬

import Foundation

var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]

for i in stride(from: 0, to: array.count, by: 1){
    var min_index = i
    for j in stride(from: i+1, to: array.count, by: 1){
        if array[min_index] > array[j] {
            min_index = j
        }
    }
    array.swapAt(i, min_index)
}
print(array)

var reversedArray = [Int]()
reversedArray = Array(array.reversed())
print(reversedArray)
