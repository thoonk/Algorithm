//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/01.
//  쉽게 푸는 문제 / 구현, 수학

let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
var nums = [Int]()

for i in 1...45 {
    nums += [Int](repeating: i, count: i)
}

var result = 0
for i in nums.indices {
    if i >= ab[0]-1, i < ab[1] {
        result += nums[i]
    }
}

print(result)
