//
//  Q1158.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/19.
//  요세푸스 문제 / 큐

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]

var nums = [Int](1...n)
var result = [Int]()
// k번째에 해당하는 인덱스
var index = k-1
while !nums.isEmpty {
    result.append(nums.remove(at: index))
    guard !nums.isEmpty else { break }
    // 다시 k번째에 해당하는 인덱스 갱신
    index = (index+k-1) % nums.count
}

print("<" + result.map { String($0) }.joined(separator: ", ") + ">")
