//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/09.
//  베스트셀러

import Foundation

let n = Int(readLine()!)!
var soldCounter = [String:Int]()
for _ in 0 ..< n {
    let book = readLine()!
    soldCounter[book, default: 0] += 1
}
let result = soldCounter.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }
print(result.first!.key)

//let maxSold = soldCounter.values.max()
//var bestSeller = [String]()
//
//for (book, sold) in soldCounter {
//    if sold == maxSold {
//        bestSeller.append(book)
//    }
//}
//
//bestSeller.sort()
//print(bestSeller[0])

