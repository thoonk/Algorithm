//
//  main.swift
//  CodingTest
//
//  Created by 김태훈 on 2020/11/02.
//  떡볶이 떡 만들기 (이진 탐색)

import Foundation

// 떡의 개수(n)와 떡의 길이(m) 입력
let nums = readLine()!.split(separator: " ").map {Int($0)!}
var n = nums[0]
var m = nums[1]
// n개의 떡의 길이 입력
var arr = readLine()!.split(separator: " ").map {Int($0)!}

var start = 0
var end = arr.max()!
var result = 0
while start <= end{
    var sum = 0
    let mid: Int = (start + end) / 2
    
    for i in arr{
        // 처음 떡의 길이가 mid 보다 클 경우 자른 떡 합 계산
        if i > mid{
            sum += i - mid
        }
    }
    // 자른 떡의 길이가 더 작을 경우
    if sum < m{
        end = mid-1
    }
    // 자른 떡의 길이가 같거나 더 클 경우
    else{
        // 최대한 덜 잘랐을 때 기록
        result = mid
        start = mid+1
    }
}

print(result)

/*
 4 6
 19 15 10 17
 */
