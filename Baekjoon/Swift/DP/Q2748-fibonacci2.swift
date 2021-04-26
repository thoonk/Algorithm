//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/26.
//  피보나치 수 2 DP
let n = Int(readLine()!)!
func solution() {
    var nums = [Int](repeating: 0, count: n+1)
    
    guard n > 1 else {
        print(n)
        return
    }
    
    nums[1] = 1
    
    for i in 2 ... n {
        nums[i] = nums[i-1] + nums[i-2]
    }
    print(nums[n])
}

solution()
