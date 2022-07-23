//
//  Q7570.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/01.
//  줄 세우기 / DP, 그리디
// LIS(최장증가수열)을 이용해서 연속된 수들 중 가장 긴 수열의 길이를 구한 뒤
// 총 인원에서 그 수를 빼면 줄 앞, 뒤로 이동하는 아이의 수를 구할 수 있다.

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n+1)
var nums = readLine()!.split(separator: " ").map { Int(String($0))! }

for num in nums {
    dp[num] = dp[num-1] + 1
}

dp.sort()
print(n-dp[n])
