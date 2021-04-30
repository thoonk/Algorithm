//
//  main.swift
//  BOJ_PS
//
//  Created by 김태훈 on 2021/04/30.
//  다리 놓기 DP, 조합

let t = Int(readLine()!)!

func combination(_ dp: inout [[Int]], _ n: Int, _ k: Int) -> Int {
    if dp[n][k] != 0 {
        return dp[n][k]
    }
    
    if k == 1 {
        return n
    } else if n == k || k == 0 {
        return 1
    } else {
        dp[n][k] = combination(&dp, n-1, k) + combination(&dp, n-1, k-1)
    }
    
    return dp[n][k]
}

for _ in 0 ..< t {
    let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nm[0]
    let m = nm[1]
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: m+1)
    
    print(combination(&dp, m, n))
}
