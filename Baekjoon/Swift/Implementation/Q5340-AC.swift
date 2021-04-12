//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/12.
//  AC 덱, 파싱, 문자열, 구현

import Foundation

func operateAC(_ p: [String], _ n: Int, _ nums: inout [Int]) -> String {
    // true: 역순 false: 정순
    var isReversed = false
    var front = 0
    var rear = 0
    
    guard nums.count >= p.filter({ $0 == "D" }).count else {
        return "error"
    }
    
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
        if isReversed == false {
            let joinedNums = Array(nums[front..<(n - rear)])
                .map { String($0) }
                .joined(separator: ",")
            return "[" + joinedNums + "]"
        } else {
            nums = nums.reversed()
            let joinedNums = Array(nums[rear..<(n - front)])
                .map { String($0) }
                .joined(separator: ",")
            return "[" + joinedNums + "]"
        }
    } else {
        return "error"
    }
}

let t = Int(readLine()!)!

for _ in 0 ..< t {
    let p = Array(readLine()!).map { String($0) }
    let n = Int(readLine()!)!
    var nums = readLine()!
        .trimmingCharacters(in: ["[","]"])
        .split(separator: ",")
        .map { Int(String($0))! }
    
    print(operateAC(p, n, &nums))
}

