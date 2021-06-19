//
//  Q3273.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/19.
//  두 수의 합 / 투 포인터, 정렬

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
let x = Int(readLine()!)!

func solution() {
    var start = 0
    var end = n - 1
    var sum = 0
    var res = 0
    
    while start != end {
        sum = nums[start] + nums[end]
        if sum == x {
            start += 1
            res += 1
        } else if sum > x {
            end -= 1
        } else {
            start += 1
        }
    }
    print(res)
}
solution()
