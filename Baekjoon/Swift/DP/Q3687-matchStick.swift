//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/20.
//  성냥개비 DP

func getMaxVal(_ num: Int) -> String {
    var num = num
    var maxVal = ""
    while num != 0 {
        if num % 2 == 0 {
            maxVal.append("1")
            num -= 2
        } else {
            maxVal.append("7")
            num -= 3
        }
    }
    return maxVal
}

func getMinVal(_ dp: inout [Int]) {
    let nums = [0,0,1,7,4,2,0,8,10]
    for i in 2...8 {
        dp[i] = nums[i]
    }
    dp[6] = 6
    
    for i in 9...100 {
        dp[i] = dp[i-2]*10 + nums[2]
        for j in 3...7 {
            dp[i] = min(dp[i], dp[i-j]*10 + nums[j])
        }
    }
}

func solution() {
    for _ in 0 ..< t {
        let n = Int(readLine()!)!
        var dp = [Int](repeating: 0, count: 101)
        
        getMinVal(&dp)
        print(String(dp[n]) + " " + getMaxVal(n))
    }
}

let t = Int(readLine()!)!
solution()
