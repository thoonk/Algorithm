//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2020/10/28.
//

import Foundation

let n = Int(readLine()!)!
var words = [String]()

for _ in stride(from: 0, to: n, by: 1) {
    words.append(readLine()!)
}

var numForWord = [Character : Int]()

for word in words{
    var cnt = 0
    for i in word {
        if numForWord[i] == nil{
            numForWord[i] = Int(pow(10.0, Double(word.count - cnt - 1)))
            
        } else {
            numForWord[i]! += Int(pow(10.0, Double(word.count - cnt - 1)))
        }
        cnt += 1
    }
}

var nums = Array(numForWord.values.sorted().reversed())

var result: Int = 0
for i in 0 ..< nums.count {
    result += nums[i] * (9-i)
}

print(result)
