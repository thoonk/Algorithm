//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/16.
//  요시푸스 문제 0 큐

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]

var nums = [Int]()
var result = [Int]()

for i in 1 ..< n + 1 {
    nums.append(i)
}

while !nums.isEmpty {
    for _ in 0 ..< k - 1 {
        nums.append(nums.first!)
        nums.removeFirst()
    }
    result.append(nums.removeFirst())
}

print("<" + result.map { String($0) }.joined(separator: ", ") + ">")
