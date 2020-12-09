//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/12/09.
//  Q1715-카드정렬하기 이진탐색

import Foundation

let n = Int(readLine()!)!
var cards = [Int]()

for _ in 0 ..< n {
    cards.binarySearchInsert(Int(readLine()!)!)
}

var result = 0

while cards.count != 1 {
    let first = cards.removeLast()
    let second = cards.removeLast()
    
    let sum = first + second
    result += sum
    cards.binarySearchInsert(sum)
}
print(result)


extension Array where Element == Int {
    mutating func binarySearchInsert(_ target: Int){
        if self.isEmpty {
            self.append(target)
            return
        }
        var start = 0
        var end = self.count - 1
        while start <= end{
            let mid = (start + end) / 2
            if self[mid] < target{
                end = mid - 1
            } else{
                start = mid + 1
            }
        }
        self.insert(target, at: start)
    }
}
