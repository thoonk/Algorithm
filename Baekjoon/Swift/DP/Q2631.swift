//
//  Q2631.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/06/01.
//  줄 세우기 / DP, 그리디
//  LIS(최장증가수열)을 이용해서 가장 긴 수열의 길이를 구한 뒤
//  총 인원에서 그 수를 빼면 옮겨야 하는 아이의 최수 수를 구할 수 있다.

let n = Int(readLine()!)!
var nums = [Int]()
var dp = [Int](repeating: 1, count: n)

for _ in 0 ..< n {
    nums.append(Int(readLine()!)!)
}

for i in 1 ..< n {
    for j in 0 ..< i {
        if nums[i] > nums[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
dp.sort()
print(n - dp[n-1])
