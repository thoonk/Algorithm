//
//  Q2847.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/05/31.
//  게임을 만든 동준이 / 그리드
//  증가하는 수열로 만드는 것이 핵심
//  뒤에서 부터 현재 인덱스가 가리키는 점수보다 바로 앞 점수가 더 크거나 같다면
//  차이를 res에 누적하고 현재 인덱스 바로 앞 점수를 1 작게 갱신

var n = Int(readLine()!)!
var nums = [Int]()
for _ in 0 ..< n {
    nums.append(Int(readLine()!)!)
}

var res = 0
for i in stride(from: n-1, to: 0, by: -1) {
    if nums[i] <= nums[i-1] {
        res += nums[i-1] - nums[i] + 1
        nums[i-1] = nums[i] - 1
    }
}
print(res)
