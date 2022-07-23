//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/02/08.
//  가장 긴 증가하는 부분 수열 DP

import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = [Int](repeating: 1, count: n)
    
    for i in 1..<n {
        for j in 0..<i {
            // i에 해당하는 숫자와 그 전 값들인 j에 해당하는 값을 비교해서 더 작은 값일 때
            if nums[i] > nums[j] {
                // i에 해당하는 최장 길이와 j에 해당하는 최장 길이+1 비교시 더 큰 값
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    // 제일 큰 값이 부분 수열의 최대 길이
    return dp.max()!
}

print(solution())
