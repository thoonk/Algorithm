//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  순차 탐색

import Foundation

print("생성할 원소 개수 입력, 다음 한 칸 띄고 찾을 문자열 입력")
var input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let target = String(input[1])

print("앞서 적은 원소 개수만큼 문자열 입력, 구분은 띄어쓰기 한 칸")
var arr = readLine()!.split(separator: " ").map {String($0)}

print(sequentialSearch(n, target, arr))

// 순차탐색
func sequentialSearch(_ n: Int, _ target: String, _ array: [String]) -> Int{
    for i in stride(from: 0, to: n, by: 1){
        if array[i] == target{
            return i + 1
        }
    }
    return -1
}

