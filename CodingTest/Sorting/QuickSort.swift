//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/01.
//

import Foundation

var array = [7, 5, 9, 0, 3, 1, 6, 2, 4, 8]


func quickSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    } else {
        let pivot = arr[0]
        let left = arr.filter {$0 < pivot}
        let right = arr.filter {$0 > pivot}
        
        return quickSort(left) + [pivot] + quickSort(right)
    }
}

print(quickSort(array))
