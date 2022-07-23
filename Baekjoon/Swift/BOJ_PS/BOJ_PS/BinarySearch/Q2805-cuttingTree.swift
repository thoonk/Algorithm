//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/23.
//  나무 자르기 이분탐색

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var trees = readLine()!.split(separator: " ").map { Int(String($0))! }

// 절단기 설정할 수 있는 최대 높이 구하기
var start = 0
var end = trees.max()!
var result = 0

while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    for tree in trees {
        if tree > mid {
            sum += tree - mid
        }
    }
    
    if sum >= m {
        result = max(result, mid)
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)
