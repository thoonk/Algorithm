//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/12.
//  AC / 덱, 파싱, 문자열, 구현

import Foundation

func oprt(_ nums: inout [Int], by p: [String]) -> String {
    // true: 역순 false: 정순
    var isReversed = false
    var front = 0
    var rear = 0
    let n = nums.count
    
    guard n >= p.filter ({ $0 == "D" }).count else { return "error" }
    
    // 실제로 배열을 뒤집거나 값을 빼내면 시간초과가 발생한다.
    // 그래서 뒤집고 빼내는 정보를 따로 저장한다.
    for cmd in p {
        if cmd == "R" {
            isReversed.toggle()
        } else if cmd == "D" {
            if isReversed == false {
                front += 1
            } else {
                rear += 1
            }
        }
    }
    
    if front + rear <= n {
        // 인덱스를 이용하여 연산 결과를 만든다.
        var res = nums[front..<(n-rear)]
            .map { String($0) }
        if isReversed == true {
            res.reverse()
        }
        return "[\(res.joined(separator: ","))]"
    } else {
        return "error"
    }
}

for _ in 0 ..< Int(readLine()!)! {
    let p = Array(readLine()!).map { String($0) }
    let n = Int(readLine()!)!
    var nums = readLine()!
        .trimmingCharacters(in: ["[","]"])
        .split(separator: ",")
        .map { Int(String($0))! }
    
    print(oprt(&nums, by: p))
}
