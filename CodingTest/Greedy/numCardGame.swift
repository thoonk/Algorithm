//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/28.
//

import Foundation

let matrix = readLine()!.split(separator: " ").map {Int($0)!}
var result = 0

for _ in stride(from: 0, to: matrix[0], by: 1){
    let data = readLine()!.split(separator: " ").map {Int($0)!}
    let minData = data.min()!
    result = max(result, minData)
}

print(result)
