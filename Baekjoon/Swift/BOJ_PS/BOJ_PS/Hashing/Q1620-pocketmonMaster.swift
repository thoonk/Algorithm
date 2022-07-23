//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/08.
//  나는야 포켓몬 몬스터 이다솜 Hashing

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var dicNum = [Int: String]()
var dicName = [String: Int]()

for i in 1 ..< n + 1 {
    let input = readLine()!
    dicNum[i] = input
    dicName[input] = i
}

for _ in 0 ..< m {
    let input = readLine()!
    if Int(input) != nil {
        print(dicNum[Int(input)!]!)
    } else {
        print(dicName[input]!)
    }
}
