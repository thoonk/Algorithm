//
//  Q2751.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/25.
//  수 정렬하기 2 / 정렬

var nums = [Int]()

for _ in 0 ..< Int(readLine()!)! {
    nums.append(Int(readLine()!)!)
}

nums.sort()
nums.forEach {
    print($0)
}
