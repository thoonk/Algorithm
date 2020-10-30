//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/10/29.
//  왕실의 나이트 

import Foundation

let input = Array(readLine()!).map {String($0)}

let row = Int(input[1])!
let col = Int(UnicodeScalar(input[0])!.value) - Int(UnicodeScalar("a").value) + 1

let movingRange = [[-2,-1],[-2,1],[2,-1],[2,1],[-1,2],[1,2],[-1,-2],[1,-2]]
var cnt = 0

for i in movingRange{
    let nextRow = row + i[0]
    let nextCol = col + i[1]
    
    if nextRow > 0, nextRow <= 8, nextCol > 0, nextCol <= 8{
        cnt += 1
    }
}

print(cnt)
